# Font Awesome SVG Icons

`font_awesome_svg_icons` is a Flutter package that generates Font Awesome icons as SVG images. This package supports duotone icons, and can be used with the PRO Plan with Font Awesome or with the free plan.

Note that this package generates `FaSvgIcons`, which is essentially an `SvgPicture` from the `flutter_svg` package, and does not generate `IconData`

## Usage

The package generates a `FontAwesomeSvgIcons` class containing functions that return the `FaSvgIcon` widget. The widget takes two optional parameters: `color` and `size`. Here's an example of how to use the package:

```dart
import 'package:font_awesome_svg_icons/font_awesome_svg_icons.dart';

class MyWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return FontAwesomeSvgIcons.duotoneUser(
      color: Colors.red,
      size: 16.0,
    );
  }
}
```

The icon names are the same as Font Awesome's icon names, but in camelcase, and are generated in the same way as in `font_awesome_flutter`.

## Setup

To use this package, first clone [this repository](https://github.com/wiigolas/font_awesome_svg_icons) to a location of your choice and run `flutter pub get` inside. This installs all dependencies.

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
dependencies:
  font_awesome_svg_icons: path/to/your/font_awesome_svg_icons
```

* Download the web version of Font Awesome Pro and open it.
* Move `icons.json` from `metadata` to `path/to/your/font_awesome_svg_icons/lib/icons` (replacing existing files).
* Run the configurator.

**Note:** This package uses `flutter_svg` at its core and does not support `<style>` attributes in the SVG file, which by default come with duotone icons from Font Awesome. To solve this problem, the configurator removes the `<defs>` section and adds `fill-opacity=".4"` (secondary opacity of your choice, can be edited in your custom `main.dart` file) before `class="fa-secondary"` in each icon containing this class in `icons.json`.

## Acknowledgements

I would like to thank the [Flutter Community](https://github.com/fluttercommunity) and [Dan Field / flutter_svg](https://github.com/dnfield), as well as all their contributors, for making this package possible.