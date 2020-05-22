import 'package:flutter/material.dart';
import 'package:tomatoclock/lesson/Lesson2.dart';
import 'package:tomatoclock/lesson/Lesson6.dart';

class Demo0Route extends StatefulWidget {
  Demo0Route({Key key}) : super(key: key);

  @override
  _Demo0State createState() => _Demo0State();
}

class _Demo0State extends State<Demo0Route> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("demo 0"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  height: 1.2,
                  fontFamily: "Courier",
                  background: new Paint()..color = Colors.yellow,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed,
                ),
                textAlign: TextAlign.center),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
//                Navigator.push(context, MaterialPageRoute(builder: (context) {
//                  return RouterTestRoute();
//                }));
//                Navigator.pushNamed(context, "new_page");
                Navigator.of(context).pushNamed("new_page_7", arguments: "hi");
              },
            ),
            RandomWordsWidget(),
            Image.asset("images/bg.jpg", width: 100.0),
            Icon(Icons.error, color: Colors.blue),
            SwitchAndCheckBoxTestRoute(),
            TextFieldTestRoute(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), //
    );
  }
}
