import 'package:flutter/material.dart';
import 'package:portfolio/utils/web/gallery_widget_web.dart';

class GalleryWidget extends StatelessWidget {
  const GalleryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: const GalleryWidgetWeb(),
    );
  }
}
