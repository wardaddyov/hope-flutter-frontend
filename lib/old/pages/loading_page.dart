import 'package:flutter/material.dart';
import 'package:hope/providers/student_list_provider.dart';
import 'package:hope/repository/student_repository.dart';
import 'package:hope/pages/main_dashboard.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  navigateToDashboard() async {
    var res = await StudentRepository.getStudents();
    if (res){
      context.read<StudentListProvider>().updateStudentList(StudentRepository.students);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardTemplate()),
      );
    }
    else{
      print('faild');
    }
  }

  @override
  void initState() {
    super.initState();
    navigateToDashboard();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Loading..."),
    );
  }
}
