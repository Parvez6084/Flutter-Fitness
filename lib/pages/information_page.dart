import 'dart:math';
import 'package:easy_localization/src/public_ext.dart';
import 'package:fitness_checker/model/InfoModel.dart';
import 'package:fitness_checker/pages/result_page.dart';
import 'package:fitness_checker/provider/information_provider.dart';
import 'package:fitness_checker/widgets/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../consts/app_images.dart';
import '../consts/app_strings.dart';

class InformationPage extends StatefulWidget {
  static const routeName = '/InformationPage';

  const InformationPage({Key? key}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {

  bool? isFemale;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _feetController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _incController = TextEditingController();


  @override
  void initState() {
    _nameController.addListener(() => setState(() {}));
    _feetController.addListener(() => setState(() {}));
    _incController.addListener(() => setState(() {}));
    _weightController.addListener(() => setState(() {}));
  }

  @override
  void didChangeDependencies() {
    isFemale = ModalRoute.of(context)!.settings.arguments as bool;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(isFemale! ? AppImages.p6 : AppImages.p3),
          )),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16),
                child: Text(
                  isFemale! ? 'moto2'.tr() : 'moto3'.tr(),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: isFemale! ? Colors.pinkAccent : Colors.white),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Consumer<InformationProvider>(
                    builder: (context, provider, _) {
                  return Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 16, top: 24, right: 16, bottom: 16),
                        height: 450,
                        width: size.width * .9,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.9),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16))),
                        child: Container(
                          margin: const EdgeInsets.all(16),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('information_header'.tr(),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                const SizedBox(height: 16),
                                SizedBox(
                                  height: 80,
                                  child: TextFieldContainer(
                                      controller: _nameController,
                                      isFemale: isFemale!,
                                      keyboardType: TextInputType.text,
                                      label: 'full_name'.tr(),
                                      lengthValue: 18,
                                      maleIcon: AppImages.boy,
                                      femaleIcon: AppImages.girl,
                                      onChanged: (value) => provider.fullName = value),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  height: 80,
                                  child: TextFieldContainer(
                                      controller: _weightController,
                                      isFemale: isFemale!,
                                      keyboardType: TextInputType.number,
                                      textFormat: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      label: 'weight'.tr(),
                                      lengthValue: 3,
                                      maleIcon: AppImages.weight,
                                      femaleIcon: AppImages.weight,
                                      onChanged: (value) =>
                                          provider.weight = int.parse(value)),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 80,
                                      width: size.width * .4,
                                      child: TextFieldContainer(
                                          controller: _feetController,
                                          isFemale: isFemale!,
                                          keyboardType: TextInputType.number,
                                          textFormat: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          label: 'feet'.tr(),
                                          lengthValue: 1,
                                          maleIcon: AppImages.feet,
                                          femaleIcon: AppImages.feet_female,
                                          onChanged: (value) =>
                                          provider.feet = int.parse(value)),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 5),
                                      height: 80,
                                      width: size.width * .4,
                                      child: TextFieldContainer(
                                          controller: _incController,
                                          isFemale: isFemale!,
                                          keyboardType: TextInputType.number,
                                          textFormat: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          label: 'inch'.tr(),
                                          lengthValue: 2,
                                          maleIcon: AppImages.inc,
                                          femaleIcon: AppImages.inc_female,
                                          onChanged: (value) =>
                                          provider.inc = int.parse(value)),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: isFemale!
                                          ? Colors.pinkAccent
                                          : Colors.teal,
                                      onPrimary: Colors.white,
                                      shadowColor: Colors.greenAccent,
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(32.0)),
                                      minimumSize: const Size(200, 50),
                                    ),
                                    onPressed: () { Navigator.pushNamed(context, ResultPage.routeName, arguments: provider.bmiCalculation(context, isFemale!, _formKey));},
                                    child: Text('checking'.tr()),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 16,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: isFemale!
                                ? Colors.pinkAccent.withOpacity(.5)
                                : Colors.tealAccent.withOpacity(.5),
                            shape: BoxShape.circle,
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: isFemale! ? Colors.pinkAccent : Colors.teal,
                            textColor: Colors.white,
                            child: const Icon(Icons.arrow_back),
                            padding: const EdgeInsets.all(8),
                            shape: const CircleBorder(),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
