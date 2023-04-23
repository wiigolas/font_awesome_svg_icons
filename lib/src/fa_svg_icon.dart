import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FaSvgIcon extends StatelessWidget {
  final Color? color;
  final String semanticsLabel;
  final double size;
  final String svg;

  const FaSvgIcon(
    this.svg, {
    this.color,
    this.semanticsLabel = '',
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    const Color defaultColor = Color(0xFF04567d);

    return SvgPicture.string(
      svg,
      colorFilter: ColorFilter.mode(
        color ?? defaultColor,
        BlendMode.srcIn,
      ),
      width: size,
      height: size,
      semanticsLabel: semanticsLabel,
    );
  }
}
