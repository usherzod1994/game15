import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game15/tools/alerts.dart';

class AdaptivePage extends StatefulWidget {
  const AdaptivePage({Key? key}) : super(key: key);

  @override
  _AdaptivePageState createState() => _AdaptivePageState();
}

class _AdaptivePageState extends State<AdaptivePage> {
  List<Color> _colorList = [Colors.teal];
  List<int> _numberList = [];
  int _objectIndex = 15;
  int _score = 0;
  int _time = 0;
  int _minut = 0;
  int _hour = 0;

  String _minut_text = "00";
  String _hour_text = "00";
  String _secound_text = "00";
  late Timer _timer;

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    // onPrimary: Colors.black87,
    primary: Colors.teal,
    // minimumSize: Size(88, 36),
    padding: EdgeInsets.all(0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(0)),
    ),
  );

  @override
  void initState() {
    super.initState();
    loadViews();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Game 15"),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.teal,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Score",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            "${_score}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.teal,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Time",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "${_hour_text}:${_minut_text}:${_secound_text}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 320,
                height: 320,
                child: GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  primary: false,
                  padding: EdgeInsets.all(20),
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  children: _numberList.map((item) {
                    var index = _numberList.indexOf(item);

                    return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          onClick(index);
                        });
                      },
                      child: Text("${_numberList[index]}"),
                      style: ElevatedButton.styleFrom(
                          primary: _colorList[index],
                          textStyle: TextStyle(fontSize: 16)),
                    );
                  }).toList(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.all(8),
                      color: Colors.teal,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Finish"),
                        style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.all(8),
                      color: Colors.teal,
                      child: ElevatedButton(
                        onPressed: () {
                          restart();
                        },
                        child: Text("Restart"),
                        style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loadViews() {
    _objectIndex = 15;
    _numberList.clear();
    _colorList.clear();
    for (int i = 0; i < 16; i++) {
      // colorList[i] = i<15?Colors.teal:Colors.white;
      _colorList.add(i < 15 ? Colors.teal : Colors.white);
      if (i < 15) {
        _numberList.add(i + 1);
      }
    }
    _numberList.shuffle();
    _numberList.add(16);

    _score = 0;
    _time = 0;
    _minut = 0;
    _hour = 0;
    _secound_text = "00";
    _minut_text = "00";
    _hour_text = "00";
    startTimeout();
  }

  void onClick(int clickIndex) {
    if ((clickIndex - _objectIndex).abs() == 1 ||
        (clickIndex - _objectIndex).abs() == 4) {
      _colorList[_objectIndex] = Colors.teal;
      _colorList[clickIndex] = Colors.white;

      int k = _numberList[_objectIndex];
      _numberList[_objectIndex] = _numberList[clickIndex];
      _numberList[clickIndex] = k;

      _objectIndex = clickIndex;

      _score++;

      check();
    }
  }

  void check() {
    bool checked = true;
    for (int i = 0; i < _numberList.length; i++) {
      if (_numberList[i] != i + 1) {
        checked = false;
        break;
      }
    }

    if (checked) {
      restart();
      showAwesomeDialog(context, "Congratulations ! ! !", "You are wen", _score, _time);
    }
  }

  void restart() {
    _timer.cancel();
    loadViews();
  }

  void startTimeout() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _time++;
        if (_time < 10) {
          _secound_text = "0$_time";
        } else if (10 <= _time && _time < 60) {
          _secound_text = "$_time";
        } else {
          _time = 0;
          _minut++;
        }

        if (_minut < 10) {
          _minut_text = "0$_minut";
        } else if (10 <= _minut && _minut < 60) {
          _minut_text = "$_minut";
        } else {
          _minut = 0;
          _hour++;
        }

        if (_hour < 10) {
          _hour_text = "0$_hour";
        } else if (10 <= _hour && _hour < 60) {
          _hour_text = "$_hour";
        } else {
          _hour = 0;
          _hour++;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
