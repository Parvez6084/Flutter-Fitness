import 'package:flutter/material.dart';

class ButtonCardImage extends StatelessWidget {
  final String imagePath, title;
  final Color backgroundColor, textColor;


  const ButtonCardImage(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.backgroundColor,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * .3,
      height: 160,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              imagePath,
              height: 50,
              width:50 ,
            ),
            const SizedBox(height: 16),
            Text(title,
                style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
