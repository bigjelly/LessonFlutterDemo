import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeRoute extends StatefulWidget {
  @override
  _ThemeRoute createState() => _ThemeRoute();
}

class _ThemeRoute extends State<ThemeRoute> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("数据共享")),
        body: Column(children: <Widget>[
          //背景为蓝色，则title自动为白色
          NavBar(color: Colors.blue, title: "标题"),
          //背景为白色，则title自动为黑色
          NavBar(color: Colors.white, title: "标题"),
          NavBar(color: Colors.blue[50], title: "50"),
          NavBar(color: Colors.blue[100], title: "100"),
          NavBar(color: Colors.blue[200], title: "200"),
          NavBar(color: Colors.blue[300], title: "300"),
          NavBar(color: Colors.blue[400], title: "400"),
          NavBar(color: Colors.blue[500], title: "500"),
          NavBar(color: Colors.blue[600], title: "600"),
          NavBar(color: Colors.blue[700], title: "700"),
          NavBar(color: Colors.blue[800], title: "800"),
          NavBar(color: Colors.blue[900], title: "900"),
        ]));
  }
}

class NavBar extends StatelessWidget {
  final String title;
  final Color color; //背景颜色

  NavBar({
    Key key,
    this.color,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(
          minHeight: 52,
          minWidth: double.infinity,
        ),
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            //阴影
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 3),
              blurRadius: 3,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    //根据背景色亮度来确定Title颜色
                    color: color.computeLuminance() < 0.5
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
              flex: 1,
            ),
            Expanded(
              child: Text(
                '#${color.value.toRadixString(16).padLeft(8, '0')}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  //根据背景色亮度来确定Title颜色
                  color: color.computeLuminance() < 0.5
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              flex: 1,
            ),
          ],
        ));
  }
}
