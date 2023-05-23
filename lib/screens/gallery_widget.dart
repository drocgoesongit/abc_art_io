import 'package:flutter/material.dart';
import 'package:portfolio/views/mobile/gallery_widget_mobile.dart';
import 'package:portfolio/views/web/gallery_widget_web.dart';

class GalleryWidget extends StatelessWidget {
  const GalleryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (builder, constraints) {
      if (constraints.maxWidth < 600) {
        return GalleryWidgetMobile();
      } else {
        return Container(
          color: Colors.white,
          child: GalleryWidgetWeb(),
        );
      }
    });
  }
}
