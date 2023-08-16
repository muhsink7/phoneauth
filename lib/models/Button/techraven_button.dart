import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../constants/image_constants.dart';

class TechravenButton extends StatelessWidget {
  final String linkUrl = "https://www.techraven.live/";

  _launchURL() async {
    if (await canLaunchUrlString(linkUrl)) {
      await launchUrlString(linkUrl);
    } else {
      throw 'Could not launch $linkUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 100,
          child: Image.asset(
            Images.techraven,
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _launchURL,
            ),
          ),
        ),
      ],
    );
  }
}
