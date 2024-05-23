import 'package:flutter/material.dart';
import 'package:melon_app/src/helper/dummy_data.dart';
import 'package:melon_app/src/helper/sizedbox_extension.dart';
import 'package:melon_app/src/models/model_character.dart';
import 'package:melon_app/src/screens/onboarding_screens.dart';
import 'package:melon_app/src/screens/view_mods.dart';

import '../helper/constants.dart';

class HomeScreen extends StatefulWidget {
  static const String route = "home_screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff17064D),
        title: Text(
          "Melon MODs",
          style: TextStyle(color: AppColors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: AppColors.green,
            unselectedLabelColor: AppColors.white,
            indicatorColor: AppColors.green,
            labelStyle: TextStyle(fontSize: 25),
            controller: _tabController,
            tabs: [
              Tab(
                text: "All",
              ),
              Tab(
                text: "Favourite",
              ),
            ]),
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
        child: TabBarView(
          controller: _tabController,
          children: [AllMods(), LikedMods()],
        ),
      ),
    );
  }
}

class AllMods extends StatelessWidget {
  const AllMods({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
        itemCount: mainModList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (mainModList[index].islocked) {
                Navigator.pushReplacementNamed(
                    context, OnboardingScreeen.route);
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ViewModScreen(modelCharacter: mainModList[index])));
              }
            },
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(mainModList[index].image),
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
                  if (mainModList[index].islocked == true) ...[
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.lock_outline,
                            color: Colors.green,
                            size: 28,
                          ),
                          10.width,
                          Text(
                            mainModList[index].name,
                            style:
                                TextStyle(color: AppColors.white, fontSize: 28),
                          ),
                        ],
                      ),
                    )
                  ] else
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        mainModList[index].name,
                        style: TextStyle(color: AppColors.white, fontSize: 28),
                      ),
                    )
                ],
              ),
            ),
          );
        });
  }
}

class LikedMods extends StatelessWidget {
  const LikedMods({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
        itemCount: modLiked.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (modLiked[index].islocked) {
                Navigator.pushReplacementNamed(
                    context, OnboardingScreeen.route);
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ViewModScreen(modelCharacter: modLiked[index])));
              }
            },
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(modLiked[index].image),
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
                              Icons.favorite,
                              size: 20,
                              color: Colors.orange,
                            ))),
                      ),
                    ),
                  ),
                  if (modLiked[index].islocked == true) ...[
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.lock_outline,
                            color: Colors.green,
                            size: 28,
                          ),
                          10.width,
                          Text(
                            modLiked[index].name,
                            style:
                                TextStyle(color: AppColors.white, fontSize: 28),
                          ),
                        ],
                      ),
                    )
                  ] else
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        modLiked[index].name,
                        style: TextStyle(color: AppColors.white, fontSize: 28),
                      ),
                    )
                ],
              ),
            ),
          );
        });
  }
}
