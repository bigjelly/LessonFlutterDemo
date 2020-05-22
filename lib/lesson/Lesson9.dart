import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => new _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {

    //下划线widget预定义以供复用。
    Widget divider1=Divider(color: Colors.blue,);
    Widget divider2=Divider(color: Colors.green);

    return new Scaffold(
      appBar: AppBar(
        title: Text("list view Test"),
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
            itemCount: _words.length,
            itemBuilder: (context, index) {
              //如果到了表尾
              if (_words[index] == loadingTag) {
                //不足100条，继续获取数据
                if (_words.length - 1 < 100) {
                  //获取数据
                  _retrieveData();
                  //加载时显示loading
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: SizedBox(
                        width: 24.0,
                        height: 24.0,
                        child: CircularProgressIndicator(strokeWidth: 2.0)),
                  );
                } else {
                  //已经加载了100条数据，不再获取数据。
                  return Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "没有更多了",
                        style: TextStyle(color: Colors.grey),
                      ));
                }
              }
              //显示单词列表项
              return ListTile(title:  RaisedButton(
                child: Text(_words[index]),
                color: Colors.blue,
                elevation: 5.0,
                //正常状态下的阴影
                highlightElevation: 8.0,
                //按下时的阴影
                disabledElevation: 0.0,
                // 禁用时的阴影
                onPressed: () {
                  //导航到新路由
                  Navigator.pushNamed(context, "new_page_8");
                },
              ));
            },
            //分割器构造器
            separatorBuilder: (BuildContext context, int index) {
              return index%2==0?divider1:divider2;
            },
          ),
        ),
      ]),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        //重新构建列表
        _words.insertAll(
            _words.length - 1,
            //每次生成20个单词
            generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      });
    });
  }
}
