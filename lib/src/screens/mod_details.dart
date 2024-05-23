import 'package:flutter/material.dart';
import 'package:melon_app/src/helper/sizedbox_extension.dart';

import '../helper/constants.dart';
import '../models/model_mod_detail.dart';

class ModDetailScreen extends StatelessWidget {
  ModelModDetail modelModDetail;
  ModDetailScreen({required this.modelModDetail, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff17064D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          modelModDetail.name,
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff17064D), // End color,
              Color.fromARGB(255, 0, 31, 56), // Start color
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.5,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  image: DecorationImage(
                    image: AssetImage(modelModDetail.image),
                    fit: BoxFit.fill,
                  )),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, right: 15),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        backgroundColor: AppColors.white,
                        child: const Padding(
                            padding: EdgeInsets.all(2),
                            child: Center(
                                child: Icon(
                              Icons.favorite_border,
                              size: 20,
                              color: Colors.orange,
                            ))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            20.height,
            Container(
              padding: const EdgeInsets.only(left: 20, top: 30),
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.2,
              decoration: BoxDecoration(
                gradient:
                    const LinearGradient(begin: Alignment.topLeft, colors: [
                  Color.fromARGB(255, 1, 40, 72),
                  Colors.blue,
                ]),
                border: Border.all(color: Colors.green),
              ),
              child: SingleChildScrollView(
                child: Text(
                  modelModDetail.details,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            20.height,
            InkWell(
              onTap: () {},
              child: Container(
                  width: 200,
                  height: 60,
                  child: Image.asset(
                    "assets/images/button.png",
                    fit: BoxFit.contain,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
