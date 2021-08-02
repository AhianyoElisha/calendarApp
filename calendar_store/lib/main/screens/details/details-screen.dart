import 'package:flutter/material.dart';
import 'package:calendar_store/theme.dart';
import 'package:calendar_store/main/screens/details/components/app_bar.dart';
import 'package:calendar_store/main/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: detailsAppBar(),
      body: Body(),
    );
  }
}
