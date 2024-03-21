import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hope/core/themes/my_input_theme.dart';
import 'package:hope/features/course/presentation/pages/course_page.dart';
import 'package:hope/features/course/presentation/provider/course_page_index_provider.dart';
import 'package:hope/features/course/presentation/provider/course_provider.dart';
import 'package:provider/provider.dart';
import 'features/login/presentation/pages/login_page.dart';
import 'features/login/presentation/provider/jwt_provider.dart';
import 'old/providers/student_dashboard_index_provider.dart';
import 'old/providers/student_for_edit_provider.dart';
import 'old/providers/student_list_provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StudentDashboardIndexProvider()),
        ChangeNotifierProvider(create: (context) => StudentListProvider()),
        ChangeNotifierProvider(create: (context) => StudentForEditProvider()),
        ChangeNotifierProvider(create: (context) => JwtProvider()),
        ChangeNotifierProvider(create: (context) => CourseProvider()),
        ChangeNotifierProvider(create: (context) => CoursePageIndexProvider()),
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
