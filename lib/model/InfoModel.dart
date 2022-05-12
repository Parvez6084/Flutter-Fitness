
import 'package:flutter/material.dart';

class InfoModel {
  String? name;
  String? image;
  String? ivMan;
  String? ivWoman;
  String? mess1;
  String? mess2;
  String? bmiScore;
  Color? color;
  bool? isFemale ;

  InfoModel({
    this.name,
    this.image ,
    this.isFemale,
    this.bmiScore,
    required this.ivMan,
    required this.ivWoman,
    required this.mess1,
    required this.mess2,
    required this.color
  });

}

class ImageModel{

  String? manImagePath;
  String? womanImagePath;

  ImageModel({required this.manImagePath, this.womanImagePath});
}
