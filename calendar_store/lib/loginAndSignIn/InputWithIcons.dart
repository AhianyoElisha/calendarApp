import 'package:flutter/material.dart';

class InputWithIcon extends StatefulWidget {
  final IconData? icon;
  final String? hint;
  InputWithIcon({this.icon, this.hint});

  @override
  _InputWithIconState createState() => _InputWithIconState();
}

class _InputWithIconState extends State<InputWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Color(0xFFBC7C7C6),
              width: 1
          ),
          borderRadius: BorderRadius.circular(49)
      ),
      child: Row(
        children: <Widget>[
          Container(
              width: 59,
              child: Icon(
                widget.icon,
                size: 19,
                color: Color(0xFFBB9B9B8),
              )
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 19),
                  border: InputBorder.none,
                  hintText: widget.hint
              ),
            ),
          )
        ],
      ),
    );
  }
}