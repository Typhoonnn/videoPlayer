import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("主页")),
        body: CatogeryList(),
      );
  }
}

class CatogeryList extends StatefulWidget {
  CatogeryList({Key? key}) : super(key: key);

  @override
  _CatogeryListState createState() => _CatogeryListState();
}

class _CatogeryListState extends State<CatogeryList> {
  List categoryList = [];
  
  getData () {
    List arr = [
      {
        "type_id": 1,
        "type_name": "电影"
      },
      {
        "type_id": 2,
        "type_name": "动作片"
      },
      {
        "type_id": 3,
        "type_name": "电视剧"
      },
      {
        "type_id": 4,
        "type_name": "剧情片"
      },
      {
        "type_id": 5,
        "type_name": "综艺"
      },
      {
        "type_id": 6,
        "type_name": "体育"
      },
    ];

    List list = arr.map((value) {
      return Container(
            width: 110,
            alignment: Alignment.center,
            child: Text("${value["type_name"]}", style: TextStyle(color: Colors.white)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(0, 185, 231, 1)
            )
          );
    }).toList();
    
    setState(() {
      categoryList = list;
      print("category list${categoryList}");
    });
  }
  @override
  void initState() {
    super.initState();
    getData();
  }
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      // child: ListView(
      //   scrollDirection: Axis.horizontal,
      //   children: <Widget>[
      //     Container(
      //       width: 110,
      //       alignment: Alignment.center,
      //       child: Text("文本1", style: TextStyle(color: Colors.white)),
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(20),
      //         color: Color.fromRGBO(0, 185, 231, 1)
      //       )
      //     ),
      //     Container(
      //       width: 180,
      //       color: Colors.blue,
      //       child: Text("文本2"),
      //     ),
      //     Container(
      //       width: 180,
      //       color: Colors.blue,
      //       child: Text("文本3"),
      //     ),
      //     Container(
      //       width: 180,
      //       color: Colors.blue,
      //       child: Text("文本4"),
      //     ),
      //     Container(
      //       width: 180,
      //       color: Colors.blue,
      //       child: Text("文本5"),
      //     )
      //   ],
      // ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return categoryList[index];
        },
      ),
    );
  }
}

