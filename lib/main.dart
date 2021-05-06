import 'package:flutter/material.dart';
import 'file:///home/artur/Desktop/walk_pal/lib/HomePage.dart';
import 'file:///home/artur/Desktop/walk_pal/lib/StepsPage.dart';
import 'file:///home/artur/Desktop/walk_pal/lib/WeatherPage.dart';
import 'TreesPage.dart';



void main()
{
  runApp(
      MyApp()

  );
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
    StepsPage(),
    WeatherPage(),
    HomePage(),
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
                icon: Icon(Icons.home),
                title: Text('Home')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.nature),
                title: Text('Your trees')
            ),
          ],

        ));
  }
}