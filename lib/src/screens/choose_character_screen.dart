import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:melon_app/src/controller/choose_character_controller.dart';
import 'package:melon_app/src/helper/dummy_data.dart';
import 'package:melon_app/src/helper/sizedbox_extension.dart';
import 'package:melon_app/src/screens/choose_machine_screen.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../controller/video_controller.dart';
import '../helper/constants.dart';
import 'choose_mods_screen.dart';

class ChooseCharacterScreen extends StatelessWidget {
  static const String route = "choose_character_screen";
  ChooseCharacterScreen({super.key});

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
                "CHOOSE YOUR CHARACTER",
                style: TextStyle(color: AppColors.white, fontSize: 40),
              ),
              20.height,
              Consumer<ChooseCharacterController>(
                builder: (context, character, child) => SizedBox(
                  height: 80,
                  child: ListView.builder(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      scrollDirection: Axis.horizontal,
                      itemCount: charactersList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            character.updateSelectedIndex(index);
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            width: 120,
                            height: 60,
                            decoration: BoxDecoration(
                                border: character.selectedIndex == index
                                    ? Border.all(
                                        color: AppColors.green,
                                        width: 5,
                                        strokeAlign:
                                            BorderSide.strokeAlignInside)
                                    : Border.all(color: Colors.transparent)),
                            child: Image.asset(
                              charactersList[index],
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
                  Navigator.pushNamed(context, ChooseMachineScreen.route);
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
