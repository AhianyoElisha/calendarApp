import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:calendar_store/theme.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).primaryColor,
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/menu.svg"),
      onPressed: () {},
    ),
    title: RichText(
      text: TextSpan(
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: "Team",
            style: Theme.of(context).primaryTextTheme.bodyText2),
          
          TextSpan(
            text: " 7",
            style: TextStyle(color: kPrimaryColor),
          ),
        ],
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset("assets/icons/notification.svg"),
        onPressed: () {},
      ),
    ],
  );
}
