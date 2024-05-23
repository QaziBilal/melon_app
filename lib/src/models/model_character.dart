// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:melon_app/src/helper/constants.dart';
import 'package:melon_app/src/helper/dummy_data.dart';
import 'package:melon_app/src/models/model_mod_detail.dart';

class ModelCharacter {
  String image;
  String name;
  bool isliked;
  bool islocked;
  List<ModelModDetail> list;

  ModelCharacter(
      {required this.image,
      required this.name,
      required this.isliked,
      required this.islocked,
      required this.list});
}

List<ModelCharacter> mainModList = [
  ModelCharacter(
      image: AppImages.building1,
      name: "Building",
      isliked: false,
      islocked: false,
      list: buildingDetailList),
  ModelCharacter(
      image: AppImages.gun1,
      name: "GUNS",
      isliked: false,
      islocked: false,
      list: gunsDetailsList),
  ModelCharacter(
      image: AppImages.item1,
      name: "ITEMS",
      isliked: false,
      islocked: false,
      list: itemDetailList),
  ModelCharacter(
      image: AppImages.npc1,
      name: "NPC",
      isliked: false,
      islocked: false,
      list: npcDetailList),
  ModelCharacter(
      image: AppImages.pack1,
      name: "PACKS",
      isliked: false,
      islocked: false,
      list: packDetailList),
  ModelCharacter(
      image: AppImages.plane1,
      name: "PLANES",
      isliked: false,
      islocked: false,
      list: planeDetailList),
  ModelCharacter(
      image: AppImages.robot1,
      name: "ROBOTS",
      isliked: false,
      islocked: false,
      list: robotDetailList),
  ModelCharacter(
      image: AppImages.tank1,
      name: "TANKS",
      isliked: false,
      islocked: false,
      list: tankDetailList),
  ModelCharacter(
      image: AppImages.war1,
      name: "WARS",
      isliked: false,
      islocked: false,
      list: warDetailList),
];

List<ModelCharacter> modLiked = [
  ModelCharacter(
      image: AppImages.mod2,
      name: "TANKS",
      isliked: true,
      islocked: false,
      list: modDetailList),
  ModelCharacter(
      image: AppImages.mod3,
      name: "PACKS",
      isliked: true,
      islocked: true,
      list: modDetailList),
  ModelCharacter(
      image: AppImages.mod1,
      name: "NPC",
      isliked: true,
      islocked: false,
      list: modDetailList),
  ModelCharacter(
      image: AppImages.mod4,
      name: "ROBOTS",
      isliked: true,
      islocked: false,
      list: modDetailList),
];
