import 'package:flutter/material.dart';

const Color kWhiteColor = Color(0xffffffff);
const Color kBlackColor = Color(0xff000000);
const Color kTransparentColor = Color(0x00FFFFFF);
const Color kScaffoldColor = Color(0xfff8f8f8);

const Color kGrey0 = Color(0xff555555);
const Color kGrey1 = Color(0xff8D9091);
const Color kGrey2 = Color(0xffCCCCCC);
const Color kGrey3 = Color(0xffEFEFEF);

const Color kPrimaryColor = Color(0xFF8c3fd2);
const Color kSecondColor = Color(0xff8639d7);
const Color kThirdColor = Color(0xfff9cafc);
const Color kDarkPurple = Color(0xff30065B);

const kDefaultGradient = LinearGradient(
  colors: [kSecondColor, kPrimaryColor],
  begin: FractionalOffset(0.0, 0.0),
  end: FractionalOffset(0.5, 0.0),
  stops: [0.0, 2.0],
  tileMode: TileMode.clamp,
);

const kWhiteGradient = LinearGradient(
  colors: [kWhiteColor, kGrey3],
  begin: FractionalOffset(0.0, 0.0),
  end: FractionalOffset(0.5, 0.0),
  stops: [0.0, 3.0],
  tileMode: TileMode.mirror,
);

const Color kRed = Color(0xffC5292A);
