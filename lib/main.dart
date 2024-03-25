import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hope/core/themes/my_input_theme.dart';
import 'package:hope/features/course/presentation/pages/course_page.dart';
import 'package:hope/features/course/presentation/provider/course_page_index_provider.dart';
import 'package:hope/features/course/presentation/provider/course_provider.dart';
import 'package:hope/features/student/presentation/providers/student_provider.dart';
import 'package:hope/old/pages/loading_page.dart';
import 'package:provider/provider.dart';
import 'features/login/presentation/pages/login_page.dart';
import 'features/login/presentation/provider/jwt_provider.dart';
import 'features/student/presentation/providers/student_page_index_provider.dart';
import 'features/student/presentation/providers/select_student.dart';
import 'old/providers/student_list_provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StudentPageIndexProvider()),
        ChangeNotifierProvider(create: (context) => StudentListProvider()),
        ChangeNotifierProvider(create: (context) => SelectStudent()),
        ChangeNotifierProvider(create: (context) => JwtProvider()),
        ChangeNotifierProvider(create: (context) => CourseProvider()),
        ChangeNotifierProvider(create: (context) => CoursePageIndexProvider()),
        ChangeNotifierProvider(create: (context) => StudentProvider()),

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
          home: LoadingPage() //DashboardTemplate(),
          ),
    ));
