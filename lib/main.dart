import 'package:bottomtabandinfor/blogMain.dart';
import 'package:bottomtabandinfor/personalInformation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.indigo,),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(vsync: this, length: 2);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() => setState(() {});

  void onTabTapped(int index) {
    setState(() {
      _tabController.index = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabController.index == 0 ? 'Blog Main' : 'Personal Information'),
        centerTitle: true,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PersonalInformation(),
          BlogMain(),
        ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _tabController.index,
        selectedItemColor: Colors.amber[900],
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Messages'),
          ),
        ],
      ),
    );
  }
}
