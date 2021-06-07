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
        actions: [
          Center(child: Text('1000')),
          IconButton(onPressed: (){}, icon: Icon(Icons.monetization_on),)
        ],
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
          ElevatedButton(onPressed: () {}, child: Text('buy a tree for 1000 coins'),),
          SizedBox(height: 50,),
          Container(
            alignment: Alignment.bottomCenter,
            height: 200,
              child:Image.asset('assets/images/tree.jpg'))

          
        ],
      ),
    );
  }
}
