import 'package:flutter/material.dart';
import 'package:melon_app/src/helper/constants.dart';
import 'package:melon_app/src/models/model_character.dart';
import 'package:melon_app/src/screens/mod_details.dart';

class ViewModScreen extends StatelessWidget {
  ModelCharacter modelCharacter;
  ViewModScreen({required this.modelCharacter, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff17064D),
          title: Text(
            modelCharacter.name,
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff17064D), // End color,
                Color.fromARGB(255, 0, 31, 56), // Start color
              ],
            ),
          ),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              padding:
                  EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
              itemCount: modelCharacter.list.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ModDetailScreen(
                                  modelModDetail: modelCharacter.list[index],
                                )));
                  },
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(modelCharacter.list[index].image),
                          fit: BoxFit.fill,
                        )),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15, right: 15),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: CircleAvatar(
                              backgroundColor: AppColors.white,
                              child: Padding(
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
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            modelCharacter.list[index].name,
                            style:
                                TextStyle(color: AppColors.white, fontSize: 28),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}
