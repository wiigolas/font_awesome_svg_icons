/// Represents metadata for an icon.
///
/// [name] The name of the icon.
///
/// [label] The label of the icon.
///
/// [searchTerms] A list of search terms for the icon.
///
/// [styles] A list of styles for the icon.
///
/// [aliases] A list of aliases for the icon.
///
/// @[svg] A map containing the SVG data for the icon.
class IconMetadata {
  final String name;
  final String label;
  final List<String> searchTerms;
  final List<String> styles;
  final List<String> aliases;
  final Map<String, dynamic> svg;

  IconMetadata(
    this.name,
    this.label,
    this.searchTerms,
    this.styles,
    this.aliases,
    this.svg,
  );
}
