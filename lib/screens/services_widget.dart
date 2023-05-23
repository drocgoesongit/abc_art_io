import 'package:flutter/material.dart';
import 'package:portfolio/views/web/services.dart';

import '../const/constants.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return // Services Container..
        Container(
      height: MediaQuery.of(context).size.height,
      color: kSecondaryColor,
      child: Services(
        width: MediaQuery.of(context).size.width / 12,
      ),
    );
  }
}
