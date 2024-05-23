import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:melon_app/src/controller/choose_mod_controller.dart';
import 'package:melon_app/src/helper/constants.dart';
import 'package:melon_app/src/helper/dummy_data.dart';
import 'package:melon_app/src/helper/sizedbox_extension.dart';
import 'package:melon_app/src/screens/choose_character_screen.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../controller/video_controller.dart';

class ChooseModScreen extends StatelessWidget {
  static const String route = "choose_mod_screen";
  ChooseModScreen({super.key});

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
                "CHOOSE YOUR MODS",
                style: TextStyle(color: AppColors.white, fontSize: 40),
              ),
              20.height,
              Consumer<ChooseModController>(
                builder: (context, mod, child) => SizedBox(
                  height: 80,
                  child: ListView.builder(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      scrollDirection: Axis.horizontal,
                      itemCount: modsList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            mod.updateSelectedIndex(index);
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            width: 120,
                            height: 60,
                            decoration: BoxDecoration(
                                border: mod.selectedIndex == index
                                    ? Border.all(
                                        color: AppColors.green,
                                        width: 5,
                                        strokeAlign:
                                            BorderSide.strokeAlignInside)
                                    : Border.all(color: Colors.transparent)),
                            child: Image.asset(
                              modsList[index],
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
                  Navigator.pushNamed(context, ChooseCharacterScreen.route);
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

List<String> images = [
  'assets/images/Dump.png',
  'assets/images/House with Balconies.png',
  'assets/images/Pirate Ship.png',
  'assets/images/Secret Military Laboratory.png',
  'assets/images/Space Station.png',
];
