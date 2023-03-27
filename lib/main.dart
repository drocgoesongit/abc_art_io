import 'package:flutter/material.dart';
import 'package:portfolio/utils/mobile/home_widget_mobile.dart';
import 'package:portfolio/views/about_widget.dart';
import 'package:portfolio/views/footer_widget.dart';
import 'package:portfolio/views/gallery_widget.dart';
import 'package:portfolio/views/home_widget.dart';
import 'package:portfolio/views/project1_widget.dart';
import 'package:portfolio/views/project2_widget.dart';
import 'package:portfolio/views/project3_widget.dart';
import 'package:portfolio/views/services_widget.dart';
import 'package:portfolio/views/testi_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ItemScrollController _scrollController = ItemScrollController();
  final scrollController = ScrollController();

  void toHome() {
    setState(() {
      _scrollController.scrollTo(
          index: 0, duration: const Duration(milliseconds: 500));
    });
  }

  void toAbout() {
    setState(() {
      _scrollController.scrollTo(
          index: 1, duration: const Duration(milliseconds: 500));
    });
  }

  void toService() {
    setState(() {
      _scrollController.scrollTo(
          index: 2, duration: const Duration(milliseconds: 500));
    });
  }

  void toProject() {
    setState(() {
      _scrollController.scrollTo(
          index: 3, duration: const Duration(milliseconds: 500));
    });
  }

  void toTestimonial() {
    setState(() {
      _scrollController.scrollTo(
          index: 6, duration: const Duration(milliseconds: 500));
    });
  }

  final List<Widget> _myList = [
    const GalleryWidget(),
    const GalleryWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemScrollController: _scrollController,
      itemCount: _myList.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return HomeWidget(
            toHome: toHome,
            toAbout: toAbout,
            toProject: toProject,
            toService: toService,
            toTestimonial: toTestimonial,
          );
        } else {
          return _myList[index];
        }
      },
    );
  }
}
