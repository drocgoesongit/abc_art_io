import 'package:flutter/material.dart';
import 'package:portfolio/views/mobile/create_art_mobile.dart';
import 'package:portfolio/views/web/create_art_web.dart';

import '../views/mobile/gallery_widget_mobile.dart';
import '../views/web/gallery_widget_web.dart';

// TODO: Change gallery widget to create art widget for respective devices. ;)

class CreateArt extends StatelessWidget {
  const CreateArt({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (builder, constraints) {
      if (constraints.maxWidth < 600) {
        return CreateArtWithPromptMobile();
      } else {
        return Container(
          color: Colors.white,
          child: CreateArtWeb(),
        );
      }
    });
  }
}
