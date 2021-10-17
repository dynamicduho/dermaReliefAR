import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:chat_snap/ui/cam_page.dart';
import 'package:chat_snap/ui/home_page.dart';
import 'package:chat_snap/ui/search_page.dart';
import 'package:chat_snap/ui/cart_page.dart';
import 'package:chat_snap/ui/user_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  int camPage = 0, homePage = 1, searchPage = 2, cartPage = 3, userPage = 4;
  int page = 0;

  bool _buttonPressed = false;
  bool _loopActive = false;
  //CameraController controller;

  @override
  void initState() {
    super.initState();
  }

  void _increaseCounterWhilePressed() async {
    // make sure that only one loop is active
    if (_loopActive) return;

    _loopActive = true;

    while (_buttonPressed && _counter < 100) {
      // do your thing
      setState(() {
        _counter++;
        // print(_counter.toString());
      });

      // wait a bit
      await Future.delayed(Duration(milliseconds: 40));
    }

    _loopActive = false;
  }

  @override
  Widget build(BuildContext context) {
    Widget getActiveView() {
      if (page == 0)
        return CamPage();
      else if (page == 1)
        return HomePage();
      else if (page == 2)
        return SearchPage();
      else if (page == 3)
        return CartPage();
      else if (page == 4) return UserPage();
      return SizedBox();
    }

    Positioned homeButton() {
      return Positioned(
        child: GestureDetector(
          onTap: () {
            setState(() {
              page = homePage;
            });
          },
          child: Column(
            children: <Widget>[
              Icon(
                Icons.home,
                color: Colors.white,
                size: 18,
              ),
            ],
          ),
        ),
        bottom: 30,
        left: 20,
      );
    }

    Positioned searchButton() {
      return Positioned(
        child: GestureDetector(
          onTap: () {
            setState(() {
              page = searchPage;
            });
          },
          child: Column(
            children: <Widget>[
              Icon(
                Icons.search,
                color: Colors.white,
                size: 18,
              ),
              Text('Chat',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ))
            ],
          ),
        ),
        bottom: 30,
        left: 40,
      );
    }

    Positioned camButton() {
      return Positioned(
        child: GestureDetector(
          onTap: () {
            setState(() {
              page = searchPage;
            });
          },
          child: Column(
            children: <Widget>[
              Icon(
                Icons.camera,
                color: Colors.white,
                size: 18,
              ),
              Text('Chat',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ))
            ],
          ),
        ),
        bottom: 30,
      );
    }

    Positioned cartButton() {
      return Positioned(
        child: GestureDetector(
          onTap: () {
            setState(() {
              page = searchPage;
            });
          },
          child: Column(
            children: <Widget>[
              Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 18,
              ),
              Text('Chat',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ))
            ],
          ),
        ),
        bottom: 30,
        right: 40,
      );
    }

    Positioned userButton() {
      return Positioned(
        child: GestureDetector(
          onTap: () {
            setState(() {
              page = searchPage;
            });
          },
          child: Column(
            children: <Widget>[
              Icon(
                Icons.person,
                color: Colors.white,
                size: 18,
              ),
              Text('Chat',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ))
            ],
          ),
        ),
        bottom: 30,
        left: 20,
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            getActiveView(),
            homeButton(),
            camButton(),
            cartButton(),
            userButton(),
          ],
        ),
      ),
    );
  }
}
