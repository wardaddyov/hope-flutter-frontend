import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hope/components/custom_button.dart';
import 'package:hope/components/dashboard_main_container.dart';
import 'package:hope/components/login_page_svgs.dart';
import 'package:hope/pages/dashboard/student/student_dashboard.dart';
import 'package:hope/custom_colors.dart';

class DashboardTemplate extends StatefulWidget {
  const DashboardTemplate({super.key});

  @override
  State<DashboardTemplate> createState() => _DashboardTemplateState();
}

class _DashboardTemplateState extends State<DashboardTemplate> {

  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    Widget page;

    switch (selectedIndex) {
      case 0:
        page = Placeholder();
      case 1:
        page = StudentDashboard();
        case 2:
        page = Placeholder();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Row(
          children: [
            buildRightColumn(),
            SizedBox(width: 10,),
            Expanded(
              child: buildLeftColumn(page),
            ),
          ],
        ),
      ),
    );
  }

  Column buildLeftColumn(Widget page) {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildLeftColumnHeader(),
                Expanded(child: DashboardMainContainer(child: page,)),
              ],
            );
  }

  SizedBox buildLeftColumnHeader() {
    return SizedBox(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xffE6E6E6),
                          radius: 20,
                          backgroundImage: AssetImage('assets/adolf.jpg')
                        ),
                        SizedBox(width: 10,),
                        Text(
                            "سلام، امید 👋 ",
                          style: TextStyle(
                            color: Color(0xff0077C0),
                            fontSize: 24
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "امیدوارم روز خوبی داشته باشی ",
                      style: TextStyle(
                          color: Color(0xffFFB81C),
                          fontSize: 14
                      ),
                    ),
                  ],
                ),
              );
  }

  SafeArea buildRightColumn() {
    return SafeArea(
              child: Column(
              children: [
                SizedBox(
                  height: 150,
                  child: Logo(),
                ),
                Expanded(
                  child: buildNavigationRail(),
                ),
              ],
          ));
  }

  NavigationRail buildNavigationRail() {
    return NavigationRail(
                    extended: false,
                    useIndicator: false,
                    minWidth: 200,
                    destinations: [
                      NavigationRailDestination(
                        icon: UnSelectedIcon(title: 'داشبورد', leadingIcon: Icons.window,),
                        selectedIcon: SelectedIcon(title: 'داشبورد', leadingIcon: Icons.window,),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: UnSelectedIcon(title: 'دانشجو', leadingIcon: Icons.school,),
                        selectedIcon: SelectedIcon(title: 'دانشجو', leadingIcon: Icons.school,),
                        label: Text('Favorites'),
                      ),
                      NavigationRailDestination(
                        icon: UnSelectedIcon(title: 'درس', leadingIcon: Icons.book,),
                        selectedIcon: SelectedIcon(title: 'درس', leadingIcon: Icons.book,),
                        label: Text('Favorites'),
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  );
  }
}
