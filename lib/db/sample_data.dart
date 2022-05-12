import 'package:easy_localization/src/public_ext.dart';
import 'package:fitness_checker/consts/app_images.dart';
import 'package:fitness_checker/model/InfoModel.dart';
import 'package:flutter/material.dart';

final sampleData = [
  InfoModel(
      ivMan: AppImages.mTing,
      ivWoman: AppImages.fTing,
      mess1: 'fitness_thick'.tr(),
      mess2: 'fitness_thick_mess'.tr(),
      color: Colors.orangeAccent),
  InfoModel(
      ivMan: AppImages.mFit,
      ivWoman: AppImages.fFit,
      mess1: 'fitness_fit'.tr(),
      mess2: 'fitness_fit_mess'.tr(),
      color: Colors.greenAccent),
  InfoModel(
      ivMan: AppImages.mFat,
      ivWoman: AppImages.fFat,
      mess1: 'fitness_fat'.tr(),
      mess2: 'fitness_fat_mess'.tr(),
      color: Colors.orange),
  InfoModel(
      ivMan: AppImages.mFat1,
      ivWoman: AppImages.fFit1,
      mess1: 'fitness_level_one_fat'.tr(),
      mess2: 'fitness_level_one_fat_mess'.tr(),
      color: Colors.deepOrange),
  InfoModel(
      ivMan: AppImages.mFat2,
      ivWoman: AppImages.fFit2,
      mess1: 'fitness_extra_level_two_fat'.tr(),
      mess2: 'fitness_extra_fat_level_two_mess'.tr(),
      color: Colors.redAccent),
  InfoModel(
      ivMan: AppImages.mFat3,
      ivWoman: AppImages.fFit3,
      mess1: 'fitness_die'.tr(),
      mess2: 'fitness_die_mess'.tr(),
      color: Colors.red),
];

final fitImageData = [
  ImageModel(manImagePath: AppImages.q1, womanImagePath: AppImages.r1),
  ImageModel(manImagePath: AppImages.q2, womanImagePath: AppImages.r2),
  ImageModel(manImagePath: AppImages.q3, womanImagePath: AppImages.r3),
  ImageModel(manImagePath: AppImages.q4, womanImagePath: AppImages.r4),
  ImageModel(manImagePath: AppImages.q5, womanImagePath: AppImages.r5),
  ImageModel(manImagePath: AppImages.q6, womanImagePath: AppImages.r6),
  ImageModel(manImagePath: AppImages.q7, womanImagePath: AppImages.r7),
  ImageModel(manImagePath: AppImages.q8, womanImagePath: AppImages.r8),
  ImageModel(manImagePath: AppImages.q9, womanImagePath: AppImages.r9),
  ImageModel(manImagePath: AppImages.q10, womanImagePath: AppImages.r5),
  ImageModel(manImagePath: AppImages.q11, womanImagePath: AppImages.r1),
  ImageModel(manImagePath: AppImages.q12, womanImagePath: AppImages.r2),
  ImageModel(manImagePath: AppImages.q13, womanImagePath: AppImages.r3),
  ImageModel(manImagePath: AppImages.q14, womanImagePath: AppImages.r4),
];
