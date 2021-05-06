import 'package:flutter/material.dart';

class TreesPage extends StatefulWidget {
  const TreesPage({Key key}) : super(key: key);

  @override
  _TreesPageState createState() => _TreesPageState();
}

class _TreesPageState extends State<TreesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trees Page'),
      ),
      body: Column(

        children: <Widget>[
          Container(

            padding: EdgeInsets.all(20),
            alignment: Alignment.center ,
            child: Text('You have already planted 10 trees', style: TextStyle(
              fontSize: 20,
              color: Colors.lightGreenAccent,

            ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            alignment: Alignment.bottomCenter,
            height: 200,
              child:Image.asset('assets/images/tree.jpg'))

          
        ],
      ),
    );
  }
}
