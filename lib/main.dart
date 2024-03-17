import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hope/my_input_theme.dart';
import 'package:hope/new_features/login/presentation/provider/jwt_provider.dart';
import 'package:hope/pages/login_page.dart';
import 'package:hope/providers/student_dashboard_index_provider.dart';
import 'package:hope/providers/student_for_edit_provider.dart';
import 'package:hope/providers/student_list_provider.dart';
import 'package:hope/pages/main_dashboard.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StudentDashboardIndexProvider()),
        ChangeNotifierProvider(create: (context) => StudentListProvider()),
        ChangeNotifierProvider(create: (context) => StudentForEditProvider()),
        ChangeNotifierProvider(create: (context) => JwtProvider()),
      ],
      child: MaterialApp(
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
          home: LoginPage() //DashboardTemplate(),
          ),
    ));
