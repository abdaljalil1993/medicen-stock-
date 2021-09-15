import 'package:flutter/material.dart';
import 'package:kidslean/home.dart';
import 'package:kidslean/login.dart';
import 'package:kidslean/splashscreen.dart';
import 'stock.dart';
import 'admin.dart';

void main() {
  runApp(MaterialApp(
    color: Colors.red[700],
    title: 'Pharmacy',
    debugShowCheckedModeBanner: false,
    home: Login(),
  ));
}
