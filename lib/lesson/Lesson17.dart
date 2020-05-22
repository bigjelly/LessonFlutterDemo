import 'package:flutter/material.dart';

class AsyncRoute extends StatefulWidget {
  @override
  _AsyncRoute createState() => _AsyncRoute();
}

class _AsyncRoute extends State<AsyncRoute> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("异步更新UI")),
        body: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'FutureBuilder',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: FutureBuilder<String>(
              future: mockNetworkData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                // 请求已结束
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    // 请求失败，显示错误
                    return Text("Error: ${snapshot.error}");
                  } else {
                    // 请求成功，显示数据
                    return Text("Contents: ${snapshot.data}");
                  }
                } else {
                  // 请求未结束，显示loading
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'StreamBuilder',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: StreamBuilder<int>(
              stream: counter(), //
              //initialData: ,// a Stream<int> or null
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                if (snapshot.hasError) return Text('Error: ${snapshot.error}');
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text('没有Stream');
                  case ConnectionState.waiting:
                    return Text('等待数据...');
                  case ConnectionState.active:
                    return Text('active: ${snapshot.data}');
                  case ConnectionState.done:
                    return Text('Stream已关闭');
                }
                return null; // unreachable
              },
            ),
          ),
        ]));
  }
}

Future<String> mockNetworkData() async {
  return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
}

Stream<int> counter() {
  return Stream.periodic(Duration(seconds: 1), (i) {
    return i;
  });
}
