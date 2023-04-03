import 'package:flutter/material.dart';

// TODO: Change gallery widget to create art widget for respective devices. ;)

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