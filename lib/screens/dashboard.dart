import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:zingify/contants/color/colors.dart';
import 'package:zingify/screens/filter.dart';
import 'package:zingify/screens/profile.dart';
import 'package:zingify/screens/search.dart';

import 'homePage.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _currentIndex = 0;
  List _screens = [Profile(), Search(), HomePage(), Filter()];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Zingify",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          elevation: 0,
          leadingWidth: 125,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_outline,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.message, color: Colors.black))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: _updateIndex,
            selectedItemColor: zingifyColor,
            selectedFontSize: 18,
            unselectedFontSize: 13,
            elevation: 35,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outlined,
                    color: Colors.black,
                  ),
                  label: "profile"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  label: "search"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.filter,
                    color: Colors.black,
                  ),
                  label: "filter"),
            ]),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("assets/dating.png"),
              ),
            ),
            Text(
              "My profile",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
