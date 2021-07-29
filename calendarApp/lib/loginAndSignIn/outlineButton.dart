import 'package:flutter/material.dart';

class OutlineBtn extends StatefulWidget {
  final String btnText;
  OutlineBtn({required this.btnText});

  @override
  _OutlineBtnState createState() => _OutlineBtnState();
}

class _OutlineBtnState extends State<OutlineBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Color(0xFFB402849),
              width: 1
          ),
          borderRadius: BorderRadius.circular(49)
      ),
      padding: EdgeInsets.all(19),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(
              color: Color(0xFFB402849),
              fontSize: 15
          ),
        ),
      ),
    );
  }
}

