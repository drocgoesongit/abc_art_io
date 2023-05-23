import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/views/mobile/home_widget_mobile.dart';
import 'package:portfolio/screens/about_widget.dart';
import 'package:portfolio/screens/footer_widget.dart';
import 'package:portfolio/screens/gallery_widget.dart';
import 'package:portfolio/screens/home_widget.dart';
import 'package:portfolio/screens/project1_widget.dart';
import 'package:portfolio/screens/project2_widget.dart';
import 'package:portfolio/screens/project3_widget.dart';
import 'package:portfolio/screens/services_widget.dart';
import 'package:portfolio/screens/testi_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBkGR4AEhZ7u1FU3qlq7s6K0rdndYiYEwc",
          appId: "787209101930",
          messagingSenderId: "787209101930",
          projectId: "abcartio",
          storageBucket: "abcartio.appspot.com"));

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const MyHomePage();
          }
          if (snapshot.hasError) {
            return const Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
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
