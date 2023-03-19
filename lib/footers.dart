import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialIcon(image: 'assets/images/github.svg', link: kGithubUrl),
              const SizedBox(width: 30.0,),
              SocialIcon(image: 'assets/images/insta_icon.svg', link: kInstaUrl),
              const SizedBox(width: 30.0,),
              SocialIcon(image: 'assets/images/gmail.svg', link: kGmail),
              const SizedBox(width: 30.0,),
              SocialIcon(image: 'assets/images/twitter_icon.svg', link: kTwitterUrl),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            "© All Rights Reserved.",
            style: kTextStyle,
          ),
          const Text(
            "Made with 💖 by Nabeel Mirza",
            style: kTextStyle,
          ),
          const SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  SocialIcon({required this.image, required this.link });

  String image;
  String link;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          if(await canLaunchUrl(Uri.parse(link))){
            await launchUrl(Uri.parse(link));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Error while entering github."),
                  duration: Duration(milliseconds: 400),
                ));
          }
        },
        child: SvgPicture.asset(image)
    );
  }
}

