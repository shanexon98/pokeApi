import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokeapi/shared/widgets/svg_image.dart';

import '../utils/assets_utils.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key, required this.body}) : super(key: key);
  final Widget body;
  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE1E1E1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: SvgImages(
              urlImage: Assets.logo,
              width: 50,
              height: 30,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: (() {
              Get.toNamed('/favorites');
            }),
            child: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: SvgImages(
                urlImage: Assets.heartFilled,
                width: 30,
                height: 30,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget.body,
      ),
    );
  }
}
