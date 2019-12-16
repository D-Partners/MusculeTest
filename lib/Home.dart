import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Home extends StatefulWidget {
  final List<String> answers;

  Home({this.answers});

  @override
  State createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _testIndex = -1;
  List<bool> _answerOt = new List();

  double _femPercent = 0.0;
  double _maskPercent = 0.0;
  double _andPercent = 0.0;

  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: _getPage());
  }

  Widget _getLastPage() {
    getPercent();

    return new SafeArea(
      child: new Column(
        children: <Widget>[
          new SizedBox(
            height: 50,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: new AutoSizeText(
                    "ТЕСТ НА ФЕМИННОСТЬ,\nМАСКУЛИННОСТЬ И АДРОГИННОСТЬ",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w100),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                new Container(
                  padding: EdgeInsets.all(16),
                  child: new SizedBox(
                    child: new GestureDetector(
                      child: Icon(
                        Icons.settings,
                        size: 32,
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          new SizedBox(
            height: 1,
            child: Container(
              decoration: BoxDecoration(color: Colors.black45),
            ),
          ),
          new Align(
            child: new Container(
              child: new Text(
                "Результаты вашего теста",
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              margin: EdgeInsets.fromLTRB(30, 20, 10, 10),
            ),
            alignment: Alignment.topLeft,
          ),
          new Container(
            padding: EdgeInsets.all(10),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Expanded(
                  child: new Text(
                    "Феминность",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new CircularPercentIndicator(
                  radius: 70,
                  lineWidth: 5,
                  percent: _femPercent,
                  center: new Text(_getPercentStr(_femPercent)),
                  progressColor: Colors.blue,
                ),
              ],
            ),
          ),
          new Container(
            padding: EdgeInsets.all(10),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Expanded(
                  child: new Text(
                    "Маскулинность",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new CircularPercentIndicator(
                  radius: 70,
                  lineWidth: 5,
                  percent: _maskPercent,
                  center: new Text(_getPercentStr(_maskPercent)),
                  progressColor: Colors.blue,
                ),
              ],
            ),
          ),
          new Container(
            padding: EdgeInsets.all(10),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Expanded(
                  child: new Text(
                    "Андрогинность",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new CircularPercentIndicator(
                  radius: 70,
                  lineWidth: 5,
                  percent: _andPercent,
                  center: new Text(_getPercentStr(_andPercent)),
                  progressColor: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getPercentStr(double perc) {
    String res = (perc * 100).toString();
    return "${res.substring(0, res.indexOf("."))}%";
  }

  Widget _getPage() {
    if (_testIndex == -1) {
      return _getStartRoot();
    } else {
      if (_testIndex < 60) {
        return new Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: new SafeArea(
            child: new Column(
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                  child: new Text(
                    "Вопрос ${_testIndex + 1}/${widget.answers.length}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
                new Expanded(
                  child: new Center(
                    child: new Text(
                      widget.answers[_testIndex],
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Expanded(
                      child: new Container(
                        padding: EdgeInsets.all(10),
                        child: new RaisedButton(
                          color: Colors.blue,
                          child: new Text(
                            "Да",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            _answerOt.add(true);
                            setState(() {
                              _testIndex += 1;
                            });
                          },
                        ),
                      ),
                    ),
                    new Expanded(
                      child: new Container(
                        padding: EdgeInsets.all(10),
                        child: new RaisedButton(
                          color: Colors.blue,
                          child: new Text(
                            "Нет",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            _answerOt.add(false);
                            setState(() {
                              _testIndex += 1;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      } else {
        return _getLastPage();
      }
    }
  }

  Widget _getStartRoot() {
    return new SafeArea(
      child: new Stack(
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new SizedBox(
                height: 50,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: new AutoSizeText(
                        "ТЕСТ НА ФЕМИННОСТЬ,\nМАСКУЛИННОСТЬ И АДРОГИННОСТЬ",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w100),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.all(16),
                      child: new SizedBox(
                        child: new GestureDetector(
                          child: Icon(
                            Icons.settings,
                            size: 32,
                          ),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              new SizedBox(
                height: 1,
                child: Container(
                  decoration: BoxDecoration(color: Colors.black45),
                ),
              ),
              new Expanded(
                child: new Container(
                  margin: EdgeInsets.all(8),
                  child: new ListView(
                    children: <Widget>[
                      new SizedBox(
                        height: 250,
                        child: Image.asset("assets/femi.jpg"),
                      ),
                      new Container(
                        margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                        child: new Text(
                          "  Феминность(женственность) - психологический пол, диагностируемый у мужчины или женщины, и показывающий, что у данного индивида доминируют женские качества.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      new SizedBox(
                        height: 250,
                        child: Image.asset("assets/mask.jpg"),
                      ),
                      new Container(
                        margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                        child: new Text(
                          "  Маскулинность(мужественность) - у того или другого пола преобладают мужские качества.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      new SizedBox(
                        height: 250,
                        child: Image.asset("assets/andro.jpg"),
                      ),
                      new Container(
                        margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                        child: new Text(
                          "  Андрогинность - и мужественность и женственность присутсвуют одновременно, и активируются в зависимости от ситуации.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                        child: new Text(
                          "  Вам будут предложены вопросы, на которые нужно ответить \"ДА\" или \"НЕТ\", в зависимости от того, что вам подходит",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                        child: new Text(
                          "  Тест можно проходить за другого человека, если вы его хорошо знаете",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      new Container(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          new Align(
            alignment: Alignment.bottomCenter,
            child: new Container(
              child: new RaisedButton(
                onPressed: () {
                  setState(() {
                    _testIndex += 1;
                  });
                },
                color: Colors.blueAccent,
                child: new Text(
                  "Начать тест",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              padding: EdgeInsets.all(10),
            ),
          ),
        ],
      ),
    );
  }

  void getPercent() {
    List<int> indexMusk = [
      1,
      4,
      7,
      10,
      13,
      16,
      19,
      22,
      25,
      28,
      31,
      34,
      37,
      40,
      43,
      46,
      49,
      52,
      55,
      58
    ];
    List<int> indexFem = [
      2,
      5,
      8,
      11,
      14,
      17,
      20,
      23,
      26,
      29,
      32,
      35,
      38,
      41,
      44,
      47,
      50,
      53,
      56,
      59
    ];
    int allMusk = 0;
    int allFem = 0;

    for (int i = 0; i < 60; i++) {
      bool res = _answerOt[i];
      if (res) {
        if (indexMusk.contains(i + 1)) {
          allMusk += 1;
        }
        if (indexFem.contains(i + 1)) {
          allFem += 1;
        }
      }
    }
    print("allMusk $allMusk");
    print("allFem $allFem");

    _maskPercent = allMusk / 60;
    _femPercent = allFem / 60;

    print("mask percent $_maskPercent");
    print("fem percent $_femPercent");

    double _is = ((allFem / 20.0) - (allMusk / 20.0)) * 2.322;
    print(_is);
    _is = _is.abs();
    if (_is < 1.0) {
      _andPercent = 1.0 - _is;
    } else {
      _andPercent = 0.0;
    }
  }
}
