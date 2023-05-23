import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/const/constants.dart';
import 'package:portfolio/views/mobile/home_widget_mobile.dart';
import 'package:portfolio/views/web/home.dart';

class HomeWidget extends StatefulWidget {
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
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (builder, constraints) {
      if (constraints.maxWidth < 600) {
        return HomeWidgetMobile();
      } else {
        return Container(
            key: const ValueKey("Home"),
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/background_photo.png"),
              fit: BoxFit.cover,
            )),
            height: MediaQuery.of(context).size.height,
            child: HomeWidgetWeb(
              toHome: widget.toHome,
              toAbout: widget.toAbout,
              toService: widget.toService,
              toProject: widget.toProject,
              toTestimonial: widget.toTestimonial,
            ));
      }
    });
  }
}
