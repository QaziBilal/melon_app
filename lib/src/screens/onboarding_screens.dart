import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:melon_app/src/helper/sizedbox_extension.dart';
import 'package:melon_app/src/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../controller/video_controller.dart';
import '../helper/constants.dart';

class OnboardingScreeen extends StatefulWidget {
  static const String route = "onboarding_screen";
  const OnboardingScreeen({super.key});

  @override
  State<OnboardingScreeen> createState() => _OnboardingScreeenState();
}

class _OnboardingScreeenState extends State<OnboardingScreeen> {
  int currentPage = 0;
  List<String> text = [
    'Enhance your gaming expereince with special MODS',
    'Customize the most powerful Tanks and Planes',
    'Unlimited to add into your game'
  ];

  @override
  Widget build(BuildContext context) {
    var videoState = Provider.of<VideoState>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Chewie(controller: videoState.chewieController),
          ),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  right: 20,
                  left: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.cancel_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text(
                      "Restore",
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Center(
                      child: Text(
                    text[0],
                    style: TextStyle(fontSize: 30, color: AppColors.white),
                    textAlign: TextAlign.center,
                  ))),
              30.height,
              Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Center(
                      child: Text(
                    text[1],
                    style: TextStyle(fontSize: 30, color: AppColors.white),
                    textAlign: TextAlign.center,
                  ))),
              30.height,
              Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Center(
                      child: Text(
                    text[2],
                    style: TextStyle(fontSize: 30, color: AppColors.white),
                    textAlign: TextAlign.center,
                  ))),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HomeScreen.route);
                },
                child: Container(
                    width: 200,
                    height: 60,
                    child: Image.asset(
                      "assets/images/button.png",
                      fit: BoxFit.contain,
                    )),
              ),
              20.height,
              const Padding(
                padding:
                    EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Terms of use",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                    const Text(
                      "Start 3-Days for Free \nThen \$4.99 per Week",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Text(
                      "Privacy Policy",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      )),
    );
  }

  onChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }
}
