import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final String btnText;
  PrimaryButton({required this.btnText});

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFB402849),
          borderRadius: BorderRadius.circular(49)
      ),
      padding: EdgeInsets.all(19),
      child: Center(
        child: Text(widget.btnText, style: TextStyle(
              color: Colors.white,
              fontSize: 15
          ),
        ),
      ),
    );

  }
}