// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'generator.dart';
import 'icon_metadata_model.dart';

// This function generates a Dart class that contains the definitions for all Font Awesome SVG icons
// based on the metadata provided in the `metadata` list. The generated code is then written to the
// file at the `outputPath`.
void main(List<String> rawArgs) async {
  // Print welcome message
  print('Font Awesome SVG Icons Configurator');

  // Check if icons.json file exists
  final File iconsJson = File('lib/icons/icons.json');
  final hasJsonFile = iconsJson.existsSync();
  if (!hasJsonFile) {
    // Print error message if the file does not exist
    print('Error: icons.json file not found!');
    exit(1); // Exit with error code 1
  }

  // Generate icon metadata and styles
  print('Generating files');
  final List<IconMetadata> metadata = [];
  final Set<String> styles = {};
  readAndPickMetadata(iconsJson, metadata, styles);

  // Generate icon definitions
  print('\nGenerating icon definitions');
  try {
    writeCodeToFile(
      () => generateIconDefinitionClass(metadata),
      'lib/font_awesome_svg_icons.dart',
    );
  } catch (e) {
    // Print error message if an exception occurs during file generation
    print('Error: Failed to generate icon definitions: $e');
    exit(1); // Exit with error code 1
  }

  // Print success message
  print('\nIcon definitions generated successfully!');
}

/// Writes the generated code to a file at the specified file path, then formats the file using the 'dart format' command.
///
/// [generator] A function that generates the code to be written to the file.
/// [filePath] The file path where the generated code should be written.
void writeCodeToFile(List<String> Function() generator, String filePath) {
  final List<String> generated = generator();
  final file = File(filePath);
  file.writeAsStringSync(generated.join('\n'));

  final result = Process.runSync('dart', ['format', filePath]);

  if (result.exitCode != 0) {
    print('Error occurred while formatting file: ${result.stderr}');
  } else {
    print('File formatted successfully.');
  }
}

/// Reads the `icons.json` file and extracts the necessary metadata for the icons.
///
/// [iconsJson] File object representing the `icons.json` file.
///
/// [metadata] List of IconMetadata objects to store the extracted metadata.
///
/// [styles] Set of strings to store the styles of the icons.
void readAndPickMetadata(
    File iconsJson, List<IconMetadata> metadata, Set<String> styles) {
  dynamic rawMetadata;
  try {
    final content = iconsJson.readAsStringSync();
    rawMetadata = json.decode(content);
  } catch (_) {
    print(
        'Error: Invalid icons.json. Please make sure you copied the correct file.');
    exit(1);
  }

  Map<String, dynamic> icon;

  // Loop through each icon in the raw metadata and extract its metadata.
  for (final iconName in rawMetadata.keys) {
    icon = rawMetadata[iconName];

    final List<String> iconStyles = (icon['styles'] as List).cast<String>();

    // Skip the icon if it has no styles or if it's marked as private.
    if (iconStyles.isEmpty) continue;
    if (icon.containsKey('private') && icon['private']) continue;

    // Add the icon's styles to the set of styles.
    styles.addAll(iconStyles);

    // Extract the search terms and aliases for the icon.
    final List<String> searchTermsRaw = icon['search']?['terms'] ?? [];
    final searchTerms = searchTermsRaw.map((String string) => string).toList();

    final List<String> aliasesRaw = icon['aliases']?['names'] ?? [];
    final aliases = aliasesRaw.map((String string) => string).toList();

    // Extract the SVG data for the icon.
    final Map<String, dynamic> svg = icon['svg'] ?? [];

    // Create an IconMetadata object for the icon and add it to the metadata list.
    metadata.add(IconMetadata(
      iconName,
      icon['label'],
      searchTerms,
      iconStyles,
      aliases,
      svg,
    ));
  }
}
