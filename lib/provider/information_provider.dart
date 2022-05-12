import 'dart:math';
import 'package:fitness_checker/db/sample_data.dart';
import 'package:fitness_checker/model/InfoModel.dart';
import 'package:flutter/material.dart';

class InformationProvider with ChangeNotifier{

  String? fullName;
  int? inc,feet,weight;
  bool? isFemale;
  String? imagePath;

 InfoModel? bmiCalculation(BuildContext context, bool isFemale, dynamic _formKey){
   if(_formKey.currentState!.validate()){
     _formKey.currentState!.save();

     int height =  (feet! * 12) + inc!;
     double bmi = weight! / pow((height * 0.0254), 2);

     InfoModel info;
     if(bmi < 18.5){
       info = sampleData[0];
     }else if(bmi > 18.5 && bmi < 24.9){
       info = sampleData[1];
     }else if(bmi > 25.0 && bmi < 29.9){
       info = sampleData[2];
     }else if(bmi > 30.0 && bmi < 34.9){
       info = sampleData[3];
     }else if(bmi > 35.0 && bmi <39.9){
       info = sampleData[4];
     }else{
       info = sampleData[5];
     }
     info.name = fullName;
     info.bmiScore = bmi.toStringAsFixed(1);
     info.isFemale = isFemale;
     info.image = isFemale ? info.ivWoman : info.ivMan;
     return info;
   }
   notifyListeners();
 }

}