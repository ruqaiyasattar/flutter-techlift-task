import 'package:flutter/material.dart';
import 'package:techlift_flutter/average_task/screens/gradeWidget.dart';
import 'package:techlift_flutter/average_task/screens/resume.dart';
import 'package:techlift_flutter/average_task/screens/search_name.dart';
import 'package:techlift_flutter/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Assignments'),
        bottom: TabBar(
          controller: _tabController,
          tabs:const [
            Tab(text: 'Resume App'),
            Tab(text: 'Grade Calculate'),
            Tab(text: 'Search Name'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Resume(),
          GradeWidget(),
          SearchItem(),
        ],
      ),
    );
  }
}
