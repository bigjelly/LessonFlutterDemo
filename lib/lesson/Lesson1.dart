import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RouterTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _RouterTestRoute();
  }
}

class _RouterTestRoute extends State<RouterTestRoute> {
  @override
  Widget build(BuildContext context) {
    var _result = "";

    void _incrementCounter(var result) {
      setState(() {
        _result = result;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("数据互传"),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () async {
                    // 打开`TipRoute`，并等待返回结果
                    var result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TipRoute(
                            // 路由参数
                            text: "我是传递数据",
                          );
                        },
                      ),
                    );
                    //输出`TipRoute`路由返回结果
//                    _incrementCounter(result);
//                    print("路由返回值: $result");
                    Fluttertoast.showToast(
                        msg: "路由返回值: $result",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIos: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  },
                  child: Text("打开提示页"),
                ),
                Text('$_result'),
              ])),
    );
  }
}

class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text, // 接收一个text参数
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("传递数据 - > " + text),
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context, "我是返回值");
                },
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //获取路由参数
    var args = ModalRoute
        .of(context)
        .settings
        .arguments;
    //...省略无关代码
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("This is new route"),
              Text("for args is :" + args)
            ],
          )),
    );
  }
}
