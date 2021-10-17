import 'package:flutter/material.dart';
import 'package:healthreminders/MainPages/Medicine.dart';
import 'package:healthreminders/MainPages/MoreOptions.dart';
import 'package:healthreminders/MainPages/HomePage.dart';
import 'package:healthreminders/MainPages/MoreReminders.dart';


//final FirebaseAuth _auth = FirebaseAuth.instance;

class Home extends StatefulWidget {



  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedTab = 0;

  final _pageOptions = [
    HomePage(),
    Medicine(),
    MoreReminders(),
    MoreOptions(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _pageOptions[_selectedTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
      // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          icon:  Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon:  ImageIcon(AssetImage('assets/pill.png')),
          title: Text('Medicines'),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            title: Text('More Reminders')
        ),
        BottomNavigationBarItem(
        icon:  ImageIcon(AssetImage('assets/Images/dots.png')),
        title: Text('More Options')
        )
  ],
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey[800],
        unselectedLabelStyle: TextStyle(color:Colors.black),

    onTap: (int index) {
      setState(() {
        _selectedTab = index;
      },


      );
    })
            );

  }
}
