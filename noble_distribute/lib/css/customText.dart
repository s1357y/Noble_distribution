import 'package:flutter/material.dart';

Text CustomText(String text, double fontsize, {Color color = Colors.black, FontWeight fw = FontWeight.bold}){
  return Text(
    text, style: TextStyle(fontSize: fontsize, fontWeight: fw, color: color),
  );
}