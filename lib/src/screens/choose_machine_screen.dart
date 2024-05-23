import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:melon_app/src/controller/choose_machine_controller.dart';
import 'package:melon_app/src/helper/dummy_data.dart';
import 'package:melon_app/src/helper/sizedbox_extension.dart';
import 'package:melon_app/src/screens/onboarding_screens.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../controller/video_controller.dart';
import '../helper/constants.dart';
import 'choose_mods_screen.dart';

class ChooseMachineScreen extends StatelessWidget {
  static const String route = "choose_machine_screen";
  ChooseMachineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var videoState = Provider.of<VideoState>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Chewie(controller: videoState.chewieController),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "CHOOSE YOUR MACHINE",
                style: TextStyle(color: AppColors.white, fontSize: 40),
              ),
              20.height,
              Consumer<ChooseMachineController>(
                builder: (context, machine, child) => SizedBox(
                  height: 80,
                  child: ListView.builder(
                      padding: EdgeInsets.only(left: 20),
                      scrollDirection: Axis.horizontal,
                      itemCount: machineList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            machine.updateSelectedIndex(index);
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 10, right: 20),
                            width: 120,
                            height: 60,
                            decoration: BoxDecoration(
                                border: machine.selectedIndex == index
                                    ? Border.all(
                                        color: AppColors.green,
                                        width: 5,
                                        strokeAlign:
                                            BorderSide.strokeAlignInside)
                                    : Border.all(color: Colors.transparent)),
                            child: Image.asset(
                              machineList[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }),
                ),
              ),
              20.height,
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, OnboardingScreeen.route);
                },
                child: Container(
                    width: 200,
                    height: 60,
                    child: Image.asset(
                      "assets/images/button.png",
                      fit: BoxFit.contain,
                    )),
              ),
              50.height
            ],
          ),
        ],
      ),
    );
  }
}
