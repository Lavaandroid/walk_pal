import 'package:flutter/material.dart';
import 'package:walk_pal/DailyStepsScreen.dart';
import 'package:walk_pal/SmogScreen.dart';
import 'package:walk_pal/WeatherPage.dart';
import 'package:walk_pal/HomePage.dart';
import 'package:walk_pal/StepsPage.dart';
import 'package:walk_pal/TreesPage.dart';
import 'package:permission_handler/permission_handler.dart';




void main()  {
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: MyBottomNavigationBar(),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override

  int _currentIndex=0;
  final List <Widget> _children=[
  //  StepsPage(),
    Steps(),
    WeatherPage(),
    //HomePage(),
    SmogScreen(),


    TreesPage(),


  ];



  void onTappedBar(int index)
  {
    setState(() {
      _currentIndex=index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_currentIndex],



        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: onTappedBar,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.directions_walk),
                title: Text('Steps')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.cloud),
                title: Text('Weather')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.waves_sharp),
                title: Text('Smog')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.nature),
                title: Text('Your trees')
            ),
          ],



        )



    );
  }
}
