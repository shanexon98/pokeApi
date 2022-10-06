import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgImages extends StatelessWidget {
  const SvgImages({Key? key, required this.urlImage, this.height, this.width})
      : super(key: key);
  final String urlImage;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      urlImage,
      height: height,
      width: width,
      allowDrawingOutsideViewBox: true,
    );
  }
}
