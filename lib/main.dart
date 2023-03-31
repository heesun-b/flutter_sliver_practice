import 'package:flutter/material.dart';
import 'package:sliver_app/ad.dart';
import 'package:sliver_app/diary.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            snap: true,
            floating: true,
            title: Text("SilverAppbar"),
            pinned: false, // appbar 고정
            expandedHeight: 250,
            flexibleSpace: Container(
              child: Center(
                child: Text(
                  "FlexibleSpace",
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
           SliverAppBar(
             title: Text("SliverAppBar"),
             pinned: true,
           ),
           SliverToBoxAdapter(
             child:  Container(
               height: 200,
               color: Colors.red,
             )
           ),
          SliverFixedExtentList(
            itemExtent: 200,
            delegate: SliverChildBuilderDelegate(
              childCount: 50,
              (context, index) {
                if (index % 4 == 0 && index != 0) {
                  return Ad((index / 4).toInt()); // 4의 배수일 때만 나타나므로
                } else {
                  return Diary(index);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  SliverList buildSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            height: 50,
            alignment: Alignment.center,
            color: Colors.lightBlue[100 * (index % 9)],
            child: Text("List Item $index"),
          );
        },
      ),
    );
  }
}
