import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Pages/ExplorePage.dart';
import 'Pages/ReelsPage.dart';
import 'Pages/ShopPage.dart';
import 'style.dart' as style;
import 'package:http/http.dart' as http;
import 'dart:convert';


import 'Pages/ProfilePage.dart';
import 'Pages/HomePage.dart';



void main() {
  runApp(
    MaterialApp(
      theme: style.theme,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int tab = 0;

  void updateBottomBar() {
   for (int i=0; i< 5; i++) {
     if (tab == i) {
       colorForThis[i] = Colors.black;
     } else {
       colorForThis[i] = Colors.grey;
     }
   }

  }

  List<Color> colorForThis = [Colors.black, Colors.grey, Colors.grey, Colors.grey, Colors.grey];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text('Instagram', style: TextStyle(color: Colors.black, fontSize: 35, fontFamily: 'Billabong'), ),
        ),
        leadingWidth: 200,
        actions: [
          IconButton(
            icon: Icon(Icons.add_box_outlined),
            onPressed: () {},
            iconSize: 30,
          ),
          IconButton(
            icon: Icon(CupertinoIcons.heart),
            onPressed: () {},
            iconSize: 30,
          ),
          IconButton(
            icon: Icon(CupertinoIcons.paperplane),
            onPressed: () {},
            iconSize: 30,
          ),
        ],
      ),
      body: [
        HomePage(),
        ExplorePage(),
        ReelsPage(),
        ShopPage(),
        ProfilePage(),


      ][tab], //instantiate a list
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.house_fill, color: colorForThis[0]), label: "Home"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.search, color: colorForThis[1]), label: "Search"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.play_rectangle, color: colorForThis[2]), label: "Reels"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.bag, color: colorForThis[3]), label: "Shopping Bag"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_crop_circle_fill, color: colorForThis[4]), label: "Profile"),

        ],
        onTap: (i) {
          tab = i;
          updateBottomBar();
          setState(() {
          });
        },
        elevation: 1,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
