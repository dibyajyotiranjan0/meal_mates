import 'package:flutter/material.dart';

class Round_Buttom_Green extends StatefulWidget {
  final Function() onpressed;
  Color color;
  String text;
  Round_Buttom_Green(
      {required this.onpressed,
      required this.color,
      super.key,
      required this.text});

  @override
  State<Round_Buttom_Green> createState() =>
      _Round_Buttom_GreenState(color: color, onpressed: onpressed, text: text);
}

class _Round_Buttom_GreenState extends State<Round_Buttom_Green> {
  final Function() onpressed;
  Color color;
  String text;
  _Round_Buttom_GreenState(
      {required this.onpressed, required this.color, required this.text});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)))),
    );
  }
}
