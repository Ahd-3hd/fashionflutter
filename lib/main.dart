import 'package:flutter/material.dart';
import 'package:app/pages/home.dart';
import 'package:app/pages/loading.dart';
import 'package:app/pages/choose_location.dart';

void main() => runApp(MaterialApp(initialRoute: '/', routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    }));
