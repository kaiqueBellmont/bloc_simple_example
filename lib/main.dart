import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:bloc_simple_example/android/app.dart';
import 'package:bloc_simple_example/ios/app.dart';

void main() => Platform.isIOS ? runApp(const IOSApp()) : runApp(AndroidApp());
