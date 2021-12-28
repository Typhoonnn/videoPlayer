import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:videoplayer/model/home_page.dart';
import 'package:videoplayer/http/http_util.dart';
import 'package:videoplayer/http/http_options.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
          title: Padding(
          padding: const EdgeInsets.fromLTRB(24, 30, 24, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text('Prime ', style: TextStyle(color: Color.fromRGBO(0, 185, 231, 1))),
              Text('Video', style: TextStyle(color: Colors.white))
            ],
          ),
        )),
        body: MainContent(),
        backgroundColor: Colors.black,
        bottomNavigationBar: Container(
            height: 100,
            padding: const EdgeInsets.only(top: 10.0),
            child: BottomNavigationBar(
            backgroundColor: const Color.fromRGBO(37, 46, 57, 1),
            selectedItemColor: const Color.fromRGBO(0, 185, 231, 1),
            unselectedItemColor: const Color.fromRGBO(90, 103, 119, 1),
            currentIndex: _currentPageIndex,
            onTap: (int index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home, size: 30,), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.search, size: 30,), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.settings, size: 30), label: "")
            ]
          ),
        )
      );
  }
}

class MainContent extends StatefulWidget {
  const MainContent({Key? key}) : super(key: key);

  @override
  _MainContentState createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  // fake data
  List imageList = [1, 2, 3, 4, 5];
  List videoList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  // List tabBarList = [];

  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // 横向分类bar
        const TabBarList(),
        // 轮播图
        ImageList(list: imageList),
        const Padding(
          padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: Text("最新发布", style: TextStyle(fontSize: 19, color: Color.fromRGBO(0, 185, 231, 1)), textAlign: TextAlign.left),
        ),
        // 推荐影片列表
        Expanded(child: VideoList(list: videoList))
      ]
    );
  }
}
class TabBarList extends StatefulWidget {
  const TabBarList({
    Key? key,
  }) : super(key: key);

  @override
  _TabBarListState createState() => _TabBarListState();
}

class _TabBarListState extends State<TabBarList> with TickerProviderStateMixin {
  // int _activeIndex = 0;
  List tabBarList = [];
  late TabController _controller;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: tabBarList.length, vsync: this); 
    _getData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 初始化数据
  void _getData() {
    HttpUtil.request(HttpOptions.baseUrl, 'get').then((value) {
      HomePageModel model = HomePageModel.fromJson(value);
      setState(() {
        // 分类列表
        tabBarList = model.typeBarList;
        _controller = TabController(length: tabBarList.length, vsync: this);
      });
    });
  }
  
  @override
  
  Widget build(BuildContext context) {
      // child: ListView.builder(
      //   scrollDirection: Axis.horizontal,
      //   itemCount: widget.tabBarList.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return GestureDetector(
      //       child: Container(
      //         width: 110,
      //         alignment: Alignment.center,
      //         child: Text(
      //             "${widget.tabBarList[index].typeName}",
      //             style: TextStyle(color: _activeIndex == index ? Colors.black : Colors.white)
      //           ),
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(20),
      //           color: _activeIndex == index ? const Color.fromRGBO(0, 185, 231, 1) : const Color.fromRGBO(0, 0, 0, 0)
      //         ),
      //       ),
      //       onTap: () {
      //         setState(() {
      //           _activeIndex = index;
      //         });
      //       },
      //     );
      //   },
      // ),
      return Expanded(
        child: Column(children: [
        Container(
          height: 40,
          // padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: TabBar(
              tabs: tabBarList.map((val) => Tab(text: val.typeName)).toList(),
              isScrollable: true,
              unselectedLabelColor: Colors.white,
              labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20), // Creates border
                color: const Color.fromRGBO(0, 185, 231, 1)
              ),
              controller: _controller
            ),
          )
        ),
        Expanded(
          child: TabBarView(
            children: tabBarList.map((val) => Text(val.typeId.toString(), style: TextStyle(color: Colors.white),)).toList(),
            controller: _controller
          ),
        )
      ])
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
      margin: const EdgeInsets.fromLTRB(0, 40, 0, 24),
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
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

class VideoList extends StatelessWidget {
  const VideoList({
    Key? key,
    required this.list
  }) : super(key: key);

  final List list;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: GridView.builder (
      itemCount: list.length,
      shrinkWrap: true, //Container跟随GridView内容变化高度
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        mainAxisSpacing: 22.0,
        crossAxisSpacing: 24.0,
      ),
      itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
              width: 160,
              height: 202,
              child: Container(
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(22, 22, 22, 1)
                )
              ),
            ),
            onTap: () {
              print("tap video item");
            },
          );
        }
      ),
    );
  }
}