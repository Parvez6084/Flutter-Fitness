import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class AnimatedToggle extends StatefulWidget {
  final List<String> values;
  final ValueChanged onToggleCallback;
  final Color backgroundColor;
  final Color buttonColor;
  final Color textColor;

   AnimatedToggle({
    required this.values,
    required this.onToggleCallback,
    this.backgroundColor = const Color(0xFFe7e7e8),
    this.buttonColor = const Color(0xFFFFFFFF),
    this.textColor =  Colors.teal,
  });
  @override
  _AnimatedToggleState createState() => _AnimatedToggleState();
}

class _AnimatedToggleState extends State<AnimatedToggle> {
  bool initialPosition = true;

@override
  void didChangeDependencies() {
  String language = context.locale.toString();
  initialPosition = language.contains('en_US') ? true : false;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: 120,
      height: 40,
      margin: const EdgeInsets.only(top: 16),
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              initialPosition = !initialPosition;
              var index = 0;
              if (!initialPosition) {
                index = 1;
              }
              widget.onToggleCallback(index);
              setState(() {});
            },
            child: Container(
              width: 120,
              height: 40,
              decoration: ShapeDecoration(
                color: widget.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  widget.values.length,
                      (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    child: Text(
                      widget.values[index],
                      style: const TextStyle(fontWeight: FontWeight.w600, color:  Colors.teal,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.decelerate,
            alignment:
            initialPosition ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              width: 60,
              height: 40,
              decoration: ShapeDecoration(
                color: widget.buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                initialPosition ? widget.values[0] : widget.values[1],
                style: TextStyle(
                  color: widget.textColor,
                ),
              ),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}