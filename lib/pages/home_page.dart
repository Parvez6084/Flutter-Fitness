import 'package:easy_localization/src/public_ext.dart';
import 'package:fitness_checker/consts/app_images.dart';
import 'package:fitness_checker/consts/app_strings.dart';
import 'package:fitness_checker/pages/information_page.dart';
import 'package:fitness_checker/provider/settingsProvider.dart';
import 'package:fitness_checker/widgets/animation_toggle.dart';
import 'package:fitness_checker/widgets/button_card_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(AppImages.image1),
          )),
          child: Consumer<SettingsProvider>(
              builder: (context, provider, _) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text('titleHeader'.tr(),
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                      Text(
                        'title_header2'.tr(),
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Colors.teal),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 24,
                  right: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('language'.tr(), style: const TextStyle(fontWeight: FontWeight.w600),),
                      AnimatedToggle(
                        values: const ['EN', 'BN'],
                        onToggleCallback: (value) {
                          if (value == 0) {
                            provider.updateLanguage(context,true);
                          }else{
                            provider.updateLanguage(context,false);
                          }
                        },
                        buttonColor: Colors.teal,
                        backgroundColor: Colors.tealAccent.withOpacity(.2),
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 16, top: 200, right: 16),
                        height: 160,
                        width: size.width * .9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.teal.withOpacity(0.4),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        left: 60,
                        child: InkWell(
                          onTap: () {
                            _goToNextPage(context, false);
                          },
                          child: ButtonCardImage(
                            imagePath: AppImages.boy,
                            title: 'male'.tr(),
                            backgroundColor: Colors.tealAccent,
                            textColor: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        right: 60,
                        child: InkWell(
                          onTap: () {
                            _goToNextPage(context, true);
                          },
                          child: ButtonCardImage(
                            imagePath: AppImages.girl,
                            title: 'female'.tr(),
                            backgroundColor: Colors.pinkAccent,
                            textColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }

  void _goToNextPage(BuildContext context, bool isFemale) {
    Navigator.pushNamed(context, InformationPage.routeName,
        arguments: isFemale);
  }
}
