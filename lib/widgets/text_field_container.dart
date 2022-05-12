import 'package:easy_localization/src/public_ext.dart';
import 'package:fitness_checker/consts/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldContainer extends StatelessWidget {
  final String label;
  final bool isFemale;
  final int lengthValue;
  final String maleIcon, femaleIcon;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final List<TextInputFormatter>? textFormat;


  const TextFieldContainer(
      {Key? key, this.textFormat,
      required this.controller,
      required this.isFemale,
      required this.keyboardType,
      required this.label,
      required this.maleIcon,
      required this.femaleIcon,
      required this.lengthValue,
      required this.onChanged,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) =>  value!.isEmpty ?  'emptyTextFieldMess'.tr() : null,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            borderSide:
                BorderSide(color: isFemale ? Colors.pinkAccent : Colors.teal)),
        prefixIcon: Padding(padding: const EdgeInsets.all( 16), child: Image.asset( isFemale? femaleIcon: maleIcon, height: 24, width: 24),),
        suffixIcon: controller.text.isNotEmpty ? IconButton(
                icon: const Icon(Icons.close, color: Colors.red,), onPressed: () => controller.clear()) : null),
      keyboardType: keyboardType,
      inputFormatters: textFormat,
      maxLength: lengthValue,
      onChanged: onChanged,
    );
  }
}
