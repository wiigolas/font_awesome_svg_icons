import 'package:recase/recase.dart';

import 'constants.dart';

/// Formats an SVG string to add fill-opacity to all elements with the class "fa-secondary".
///
/// [svgString] The original SVG string to format.
///
/// [opacity] The opacity value to apply to the "fa-secondary" elements.
///
/// return A formatted SVG string with fill-opacity applied to "fa-secondary" elements.
String formatSvgString(
  String svgString, {
  double opacity = 0.4,
}) {
  try {
    final String formattedString = svgString.replaceAll(
        '<defs><style>.fa-secondary{opacity:.4}</style></defs>', '');
    final index = formattedString.indexOf('class="fa-secondary');

    return '${formattedString.substring(0, index)}fill-opacity="$opacity" ${formattedString.substring(index)}';
  } catch (_) {
    return svgString;
  }
}

/// Normalizes the icon name by applying any necessary adjustments and adding a prefix
/// to avoid naming conflicts when an icon has multiple styles.
///
/// [iconName] The original name of the icon.
///
/// [style] The current style being processed.
///
/// [styleCompetitors] The total number of styles available for the icon.
String normalizeIconName(String iconName, String style, int styleCompetitors) {
  // Apply any necessary adjustments to the icon name
  String newIconName = nameAdjustments[iconName] ?? iconName;

  // Add a prefix to the icon name to avoid naming conflicts when the icon has
  // multiple styles, but only if the current style is not the regular style
  if (styleCompetitors > 1 && style != "regular") {
    newIconName = "${style}_$newIconName";
  }

  // Convert the normalized icon name to camel case and return it
  return newIconName.camelCase;
}
