import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 0, 0, 0),
          title: Padding(
          padding: EdgeInsets.fromLTRB(24, 30, 24, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Prime ', style: TextStyle(color: Color.fromRGBO(0, 185, 231, 1))),
              Text('Video', style: TextStyle(color: Colors.white))
            ],
          ),
        )),
        body: MainContent(),
        backgroundColor: Colors.black
      );
  }
}

class MainContent extends StatefulWidget {
  MainContent({Key? key}) : super(key: key);

  @override
  _MainContentState createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  // fake data
  List imageList = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CatogeryList(),
        ImageList(list: imageList),
        Padding(
          padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: Text("最新发布", style: TextStyle(fontSize: 19, color: Color.fromRGBO(0, 185, 231, 1)), textAlign: TextAlign.left),
        )
      ]
    );
  }
}
class CatogeryList extends StatefulWidget {
  CatogeryList({Key? key}) : super(key: key);

  @override
  _CatogeryListState createState() => _CatogeryListState();
}

class _CatogeryListState extends State<CatogeryList> {
  int _activeIndex = 0;
  List categoryList = [];
  
  getData () {
    // todo: getdata from backend
    List list = [
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
    
    setState(() {
      categoryList = list;
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
      padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
              width: 110,
              alignment: Alignment.center,
              child: Text(
                  "${categoryList[index]["type_name"]}",
                  style: TextStyle(color: _activeIndex == index ? Colors.black : Colors.white)
                ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: _activeIndex == index ? Color.fromRGBO(0, 185, 231, 1) : Color.fromRGBO(0, 0, 0, 0)
              ),
            ),
            onTap: () {
              setState(() {
                _activeIndex = index;
              });
            },
          );
          
        },
      ),
    );
  }
}


class ImageList extends StatelessWidget {
  const ImageList({
    Key? key,
    required this.list
  }) : super(key: key);

  final List list;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 172,
      margin: EdgeInsets.fromLTRB(0, 40, 0, 24),
      padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
              width: 306,
              padding: EdgeInsets.fromLTRB(0, 0, 24, 0),
              child: Container(
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(0, 185, 231, 1)
                )
              ),
            ),
            onTap: () {
              print("tap image item");
            },
          );
          
        },
      ),
    );
  }
}
