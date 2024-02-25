import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hope/my_input_theme.dart';
import 'package:hope/pages/login_page.dart';

void main() => runApp(MaterialApp(

  locale: const Locale('ar'),
  supportedLocales: const [
    Locale('ar'),
    Locale('en'),
  ],
  localizationsDelegates: const [
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ],
  theme: ThemeData(
    fontFamily: 'Yekan',
    inputDecorationTheme: MyInputTheme().theme(),
  ),
  debugShowCheckedModeBanner: false,
  home: LoginPage(),
));