import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:fitness_checker/db/sample_data.dart';
import 'package:fitness_checker/model/InfoModel.dart';
import 'package:fitness_checker/consts/app_strings.dart';
import 'package:fitness_checker/pages/home_page.dart';
import 'package:fitness_checker/provider/information_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatelessWidget {
  static const routeName = '/ResultPage';

  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    InfoModel infoModel =
        ModalRoute.of(context)!.settings.arguments as InfoModel;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                top: 16,
                left: 16,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                           Text('BMI', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: infoModel.isFemale! ? Colors.pinkAccent : Colors.teal)),
                          Text(infoModel.bmiScore!, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: infoModel.color!)),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 4,
                      height: 60,
                      child:  DecoratedBox(
                        decoration:  BoxDecoration(
                            color:  infoModel.isFemale!? Colors.pinkAccent : Colors.teal,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('hello'.tr(),
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                          Text(infoModel.name!,
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: infoModel.isFemale! ? Colors.pinkAccent : Colors.teal),),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 16),
              Positioned(
                  top: 80,
                  right: 16,
                  left: 16,
                  child:
                      Image.asset(infoModel.image!, height: size.height * .35)),
              Positioned(
                bottom: 300,
                left: 16,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      color: infoModel.color!.withOpacity(.1)),
                  width: size.width * .9,
                  child: Row(
                    children: [
                      Container(height: 60, width: 4, color: infoModel.color),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText(
                                infoModel.mess1!,
                                textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: infoModel.color),
                                speed: const Duration(milliseconds: 50),
                              ),
                            ],
                            totalRepeatCount: 1,
                          ),
                          AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                infoModel.mess2!,
                                textStyle: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                                speed: const Duration(milliseconds: 200),
                              ),
                            ],
                            totalRepeatCount: 1,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin:
                  const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  height: 240,
                  width: size.width * .9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(16),),
                    boxShadow: [
                      BoxShadow(
                        color: infoModel.color!.withOpacity(0.4),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16,top: 8),
                        child: Text('some_exercises'.tr()),
                      ),
                      Consumer<InformationProvider>(
                        builder: (context, provider, _) {
                          return CarouselSlider(
                              items: fitImageData.map((i) {
                                String? path = infoModel.isFemale!? i.womanImagePath : i.manImagePath  ;
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Card(
                                      margin: const EdgeInsets.all(16),
                                        child: Lottie.asset( path!,width: 400, fit: BoxFit.fill)
                                    );
                                  },
                                );
                              }).toList(),
                              options: CarouselOptions(
                                height: 200,
                                aspectRatio: 16/9,
                                viewportFraction: 0.75,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 3),
                                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                //  onPageChanged: callbackFunction,
                                scrollDirection: Axis.horizontal,
                              ));
                        },
                      ),
                    ],
                  ),
                ),),
              Positioned(
                right: 16,
                bottom: 230,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: infoModel.isFemale!
                        ? Colors.pinkAccent.withOpacity(.5)
                        : Colors.tealAccent.withOpacity(.5),
                    shape: BoxShape.circle,
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, HomePage.routeName, (route) => false);
                    },
                    color:
                        infoModel.isFemale! ? Colors.pinkAccent : Colors.teal,
                    textColor: Colors.white,
                    child: const Icon(Icons.home),
                    padding: const EdgeInsets.all(8),
                    shape: const CircleBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
