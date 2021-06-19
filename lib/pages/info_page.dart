import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key, required this.score, required this.time}) : super(key: key);

  final int time;
  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Info Page"),),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Score: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  Text("$score", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Time: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  Text("${timeFormat(time)}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String timeFormat(int second){

    String min = (second/60).round()<10?"0${(second/60).round()}":"${(second/60).round()}";
    String sec = (second - (second/60).round()*60) < 10 ? "0${(second - (second/60).round()*60)}":"${(second - (second/60).round()*60)}";

    return "${min}:${sec}";
  }

}
