import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_checker/consts/app_fonts.dart';
import 'package:fitness_checker/consts/app_paths.dart';
import 'package:fitness_checker/consts/app_strings.dart';
import 'package:fitness_checker/provider/information_provider.dart';
import 'package:fitness_checker/provider/settingsProvider.dart';
import 'package:fitness_checker/pages/information_page.dart';
import 'package:fitness_checker/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [AppStrings.english,AppStrings.bengali],
      path: AppPaths.languagePath,
      fallbackLocale: AppStrings.english,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SettingsProvider()),
        ChangeNotifierProvider(create: (context) => InformationProvider()),
      ],
      child: MaterialApp(
        title: 'Fitness Check Project',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(fontFamily: AppFonts.poppins),
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          InformationPage.routeName: (context) => const InformationPage(),
          ResultPage.routeName: (context) => const ResultPage()
        },
      ),
    );
  }
}
