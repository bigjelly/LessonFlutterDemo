import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tomatoclock/been/MainRouteBeen.dart';
import 'package:tomatoclock/higlesson/Lesson19.dart';
import 'package:tomatoclock/lesson/Lesson0.dart';
import 'package:tomatoclock/lesson/Lesson1.dart';
import 'package:tomatoclock/lesson/Lesson10.dart';
import 'package:tomatoclock/lesson/Lesson11.dart';
import 'package:tomatoclock/lesson/Lesson12.dart';
import 'package:tomatoclock/lesson/Lesson13.dart';
import 'package:tomatoclock/lesson/Lesson14.dart';
import 'package:tomatoclock/lesson/Lesson15_2.dart';
import 'package:tomatoclock/lesson/Lesson16.dart';
import 'package:tomatoclock/lesson/Lesson17.dart';
import 'package:tomatoclock/lesson/Lesson18.dart';
import 'package:tomatoclock/lesson/Lesson3.dart';
import 'package:tomatoclock/lesson/Lesson4.dart';
import 'package:tomatoclock/lesson/Lesson7.dart';
import 'package:tomatoclock/lesson/Lesson8.dart';
import 'package:tomatoclock/lesson/Lesson9.dart';

import 'lesson/Lesson16_2.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    reportErrorAndLog(details);
  };
  runZoned(
    () => runApp(MyApp()),
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        collectLog(line); // 收集日志
      },
    ),
    onError: (Object obj, StackTrace stack) {
      var details = makeDetails(obj, stack);
      reportErrorAndLog(details);
    },
  );
}

void collectLog(String line) {
  //收集日志
}

void reportErrorAndLog(FlutterErrorDetails details) {
  //上报错误和日志逻辑
}

FlutterErrorDetails makeDetails(Object obj, StackTrace stack) {
  // 构建错误信息
  return FlutterErrorDetails(stack: stack);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "new_page": (context) => Demo0Route(),
        "new_page_0": (context) => Demo0Route(),
        "new_page_1": (context) => RouterTestRoute(),
        "new_page_3": (context) => CounterWidgetRoute(),
        "new_page_4": (context) => CupertinoTestRoute(),
        "new_page_7": (context) => FormTestRoute(),
        "new_page_8": (context) => ScaffoldRoute(),
        "new_page_9": (context) => InfiniteListView(),
        "new_page_10": (context) => InfiniteGridView(),
        "new_page_11": (context) => CustomScrollViewTestRoute(),
        "new_page_12": (context) => ScrollControllerTestRoute(),
        "new_page_13": (context) => ScrollNotificationTestRoute(),
        "new_page_14": (context) => InheritedWidgetTestRoute(),
        "new_page_15": (context) => ProviderRoute(),
        "new_page_16": (context) => ThemeRoute(),
        "new_page_17": (context) => ThemeTestRoute(),
        "new_page_18": (context) => AsyncRoute(),
        "new_page_19": (context) => DialogRoute(),
        "new_page_20": (context) => GestureDetectorTestRoute(),

        "tip2": (context) {
          return TipRoute(text: ModalRoute.of(context).settings.arguments);
        },
        "/": (context) => MyHomePage(title: 'Flutter Demo Home Page'),
//          "/": (context) => ParentWidget(),
        //注册首页路由
      },
//        onGenerateRoute: (RouteSettings settings) {
//          return MaterialPageRoute(builder: (context) {
//            String routeName = settings.name;
//            if (routeName == "new_page_0") {
//              // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
//              // 引导用户登录；其它情况则正常打开路由。
//              return Demo0Route();
//            } else {
//              return EchoRoute();
//            }
//          });
//        }
//      home: MyHomePage(title: '番茄钟'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _list = new List<MainRouteBeen>();

  DateTime _lastPressedAt; //上次点击时间

//下划线widget预定义以供复用。
  Widget divider1 = Divider(
    color: Colors.blue,
  );
  Widget divider2 = Divider(color: Colors.green);

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: <Widget>[
        DecoratedBox(
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.blue, Colors.blue[700]]),
                //背景渐变
                borderRadius: BorderRadius.circular(5.0),
                //3像素圆角
                boxShadow: [
                  //阴影
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0)
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
              child: ListTile(title: Text("列表")),
            )),
        Expanded(
          child: ListView.separated(
            itemCount: _list.length + 1,
            itemBuilder: (context, index) {
              //如果到了表尾
              if (_list.length == index) {
                //已经加载了100条数据，不再获取数据。
                return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "没有更多了",
                      style: TextStyle(color: Colors.grey),
                    ));
              }

              //显示单词列表项
              return ListTile(
                  title: RaisedButton(
                child: Text(_list[index].name),
                color: Colors.blue,
                elevation: 5.0,
                //正常状态下的阴影
                highlightElevation: 8.0,
                //按下时的阴影
                disabledElevation: 0.0,
                // 禁用时的阴影
                onPressed: () {
                  if (_list[index].arguments != null) {
                    Navigator.of(context).pushNamed(_list[index].routeName,
                        arguments: _list[index].arguments);
                  } else {
                    //导航到新路由

                    //导航到新路由
//                Navigator.push(context, MaterialPageRoute(builder: (context) {
//                  return RouterTestRoute();
//                }));
                    Navigator.pushNamed(context, _list[index].routeName);
                  }
                },
              ));
            },
            //分割器构造器
            separatorBuilder: (BuildContext context, int index) {
              return index % 2 == 0 ? divider1 : divider2;
            },
          ),
        ),
        new WillPopScope(
            onWillPop: () async {
              if (_lastPressedAt == null ||
                  DateTime.now().difference(_lastPressedAt) >
                      Duration(seconds: 1)) {
                //两次点击间隔超过1秒则重新计时
                _lastPressedAt = DateTime.now();
                Fluttertoast.showToast(
                    msg: "1秒内连续按两次返回键退出",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
                return false;
              }
              return true;
            },
            child: Container(
//              alignment: Alignment.center,
//              child: Text("1秒内连续按两次返回键退出"),
                )),
      ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _retrieveData() {
    setState(() {
      //重新构建列表
      _list.add(new MainRouteBeen(name: 'go to test0', routeName: 'new_page'));
      _list.add(new MainRouteBeen(
          name: 'go to 路由传值', routeName: 'new_page_1', arguments: 'hi'));
      _list.add(new MainRouteBeen(name: 'go to 生命周期', routeName: 'new_page_3'));
      _list.add(
          new MainRouteBeen(name: 'go to BUTTON', routeName: 'new_page_4'));
      _list.add(new MainRouteBeen(name: 'go to 表单', routeName: 'new_page_7'));
      _list.add(new MainRouteBeen(name: 'go to 通用界面', routeName: 'new_page_8'));
      _list.add(
          new MainRouteBeen(name: 'go to listview', routeName: 'new_page_9'));
      _list.add(
          new MainRouteBeen(name: 'go to gridview', routeName: 'new_page_10'));
      _list.add(new MainRouteBeen(
          name: 'go to CustomScrollView', routeName: 'new_page_11'));
      _list.add(
          new MainRouteBeen(name: 'go to 滚动事件1', routeName: 'new_page_12'));
      _list.add(
          new MainRouteBeen(name: 'go to 滚动事件2', routeName: 'new_page_13'));
      _list
          .add(new MainRouteBeen(name: 'go to 数据共享', routeName: 'new_page_14'));
      _list
          .add(new MainRouteBeen(name: 'go to 跨组件状态共享', routeName: 'new_page_15'));
      _list
          .add(new MainRouteBeen(name: 'go to 主题色', routeName: 'new_page_16'));
      _list
          .add(new MainRouteBeen(name: 'go to 主题练习', routeName: 'new_page_17'));
      _list
          .add(new MainRouteBeen(name: 'go to 异步更新UI', routeName: 'new_page_18'));
      _list
          .add(new MainRouteBeen(name: 'go to 对话框详解', routeName: 'new_page_19'));
      _list
          .add(new MainRouteBeen(name: 'go to 手势识别', routeName: 'new_page_20'));
    });
  }
}
