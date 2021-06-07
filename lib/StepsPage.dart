import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StepsPage extends StatefulWidget {
  const StepsPage({Key key}) : super(key: key);

  @override
  _StepsPageState createState() => _StepsPageState();
}


class _StepsPageState extends State<StepsPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Center(child: Text('1000')),
          IconButton(onPressed: (){}, icon: Icon(Icons.monetization_on),)
        ],
        title: Text('Steps Page'),
      ),
      body:
      Container(
        color: Colors.yellow,
       child: Column(
         children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: CircularPercentIndicator(
                progressColor: Colors.orange,

                percent: 0.5,
                animation: true,
                radius: 250,
                lineWidth: 15,
                circularStrokeCap: CircularStrokeCap.round,
                center: Text('STEPS!'),
              ),
            )

          ],
       ),
      )
    );
  }
}
