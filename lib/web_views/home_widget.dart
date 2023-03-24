import 'package:flutter/material.dart';
import 'package:portfolio/const/constants.dart';
import 'package:portfolio/utils/web/home.dart';

class HomeWidget extends StatelessWidget {
  final Function toHome;
  final Function toAbout;
  final Function toService;
  final Function toProject;
  final Function toTestimonial;

  HomeWidget(
      {required this.toHome,
      required this.toAbout,
      required this.toService,
      required this.toProject,
      required this.toTestimonial});

  @override
  Widget build(BuildContext context) {
    return Container(
        key: const ValueKey("Home"),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/background_photo.png"),
          fit: BoxFit.cover,
        )),
        height: MediaQuery.of(context).size.height,
        child: HomeWidgetWeb(
          toHome: toHome,
          toAbout: toAbout,
          toService: toService,
          toProject: toProject,
          toTestimonial: toTestimonial,
        ));
  }
}
