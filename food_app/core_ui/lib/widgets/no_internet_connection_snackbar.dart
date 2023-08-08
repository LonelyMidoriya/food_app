import 'package:flutter/material.dart';

import 'custom_text.dart';

const SnackBar noInternetConnectionSnackBar = SnackBar(
  behavior: SnackBarBehavior.floating,
  elevation: 50,
  backgroundColor: Colors.teal,
  content: CustomText(
    text: 'No Internet connection!',
    fontWeight: FontWeight.w800,
  ),
  duration: Duration(seconds: 2),
  margin: EdgeInsets.symmetric(
    vertical: 60,
    horizontal: 30,
  ),
);
