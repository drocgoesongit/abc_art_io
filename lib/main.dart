import 'package:flutter/material.dart';
import 'package:portfolio/web_views/about_widget.dart';
import 'package:portfolio/web_views/footer_widget.dart';
import 'package:portfolio/web_views/home_widget.dart';
import 'package:portfolio/web_views/project1_widget.dart';
import 'package:portfolio/web_views/project2_widget.dart';
import 'package:portfolio/web_views/project3_widget.dart';
import 'package:portfolio/web_views/services_widget.dart';
import 'package:portfolio/web_views/testi_widget.dart';
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
          index: 0, duration: const Duration(seconds: 1));
    });
  }

  void toAbout() {
    setState(() {
      _scrollController.scrollTo(
          index: 1, duration: const Duration(seconds: 1));
    });
  }

  void toService() {
    setState(() {
      _scrollController.scrollTo(
          index: 2, duration: const Duration(seconds: 1));
    });
  }

  void toProject() {
    setState(() {
      _scrollController.scrollTo(
          index: 3, duration: const Duration(seconds: 1));
    });
  }

  void toTestimonial() {
    setState(() {
      _scrollController.scrollTo(index: 6, duration: Duration(seconds: 1));
    });
  }

  final List<Widget> _myList = [
    AboutWidget(),
    AboutWidget(),
    ServicesWidget(),
    Project1Widget(),
    const Project2Widget(),
    Project3Widget(),
    TestimonialWidget(),
    FooterWidget()
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

    // Container(
    //   decoration:const BoxDecoration(
    //       image: DecorationImage(
    //         image: AssetImage("assets/images/button_pink_bg.png"),
    //         fit: BoxFit.cover,
    //       )
    //   ),
    //   height: 60,
    //   // color: Colors.transparent,
    //   child: Center(
    //       child: Row(
    //         children: [
    //           Padding(
    //             padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/12),
    //             child: const Text(
    //               "Your Logo",
    //               style: kSubBoldWhiteTitle,
    //             ),
    //           ),
    //           Expanded(child: Container()),
    //           const Text(
    //             "Home",
    //             style: kButtonText,
    //           ),
    //           SizedBox(
    //             width: MediaQuery.of(context).size.width/24,
    //           ),
    //           GestureDetector(
    //             onTap: () {
    //             },
    //             child: const Text(
    //               "About",
    //               style: kButtonText,
    //             ),
    //           ),
    //           SizedBox(
    //             width: MediaQuery.of(context).size.width/24,
    //           ),
    //           const Text(
    //             "Services",
    //             style: kButtonText,
    //           ),
    //           SizedBox(
    //             width: MediaQuery.of(context).size.width/24,
    //           ),
    //           Padding(
    //             padding: EdgeInsets.only(right: MediaQuery.of(context).size.width/12),
    //             child: const Text(
    //               "Projects",
    //               style: kButtonText,
    //             ),
    //           ),
    //         ],
    //       )
    //   ),
    // ),
    // return SingleChildScrollView(
    //   controller: scrollController,
    //   child: Column(
    //       children: [
    //

    // // Home Container.
    // Container(
    //   key: const ValueKey("Home"),
    //   decoration: const BoxDecoration(
    //     image: DecorationImage(
    //       image: AssetImage("assets/images/purple_bg.png"),
    //       fit: BoxFit.cover,
    //     )
    //   ),
    //   height: MediaQuery.of(context).size.height,
    //   child: HomeScreen(width: MediaQuery.of(context).size.width/12,),
    // ),
    //
    //
    //
    // Container(
    //   height: MediaQuery.of(context).size.height,
    //   decoration: const BoxDecoration(
    //       image: DecorationImage(
    //         image: AssetImage("assets/images/plain_bg.png"),
    //         fit: BoxFit.cover,
    //       )
    //   ),
    //   child: Project2(width: MediaQuery.of(context).size.width/12,),
    // ),
    //
    // Container(
    //   height: MediaQuery.of(context).size.height,
    //   decoration: const BoxDecoration(
    //       image: DecorationImage(
    //         image: AssetImage("assets/images/plain_bg.png"),
    //         fit: BoxFit.cover,
    //       )
    //   ),
    //   child: Project3(width: MediaQuery.of(context).size.width/12,),
    // ),
    //
    // Container(
    //   height: MediaQuery.of(context).size.height,
    //   decoration: const BoxDecoration(
    //       image: DecorationImage(
    //         image: AssetImage("assets/images/plain_bg.png"),
    //         fit: BoxFit.cover,
    //       )
    //   ),              child: Testimonials(width: MediaQuery.of(context).size.width/12,),
    // ),
    //
    // Container(
    //   decoration: const BoxDecoration(
    //       image: DecorationImage(
    //         image: AssetImage("assets/images/button_pink_bg.png"),
    //         fit: BoxFit.cover,
    //       )
    //   ),
    //   child: Footer(),
    // )
    //       ],
    //   ),
    // );
  }
}
