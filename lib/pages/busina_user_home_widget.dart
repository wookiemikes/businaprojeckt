import 'package:flutter/material.dart';
import 'package:busina/pages/busina_user_bookconfirm.dart';
import 'package:busina/pages/busina_user_confirmation.dart';
import 'package:busina/pages/busina_user_ticket.dart';

class Home extends StatefulWidget {
 @override
 State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [BookingPage(),BookingConfirmPage(),TicketPage()];
 @override
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('My Flutter App'),
     ),
     body: _children[_currentIndex], // new
     bottomNavigationBar: BottomNavigationBar(
       onTap: onTabTapped, // new
       currentIndex: _currentIndex, // new
       items: [
         new BottomNavigationBarItem(
           icon: Icon(Icons.home),
           title: Text('Home'),
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.mail),
           title: Text('Messages'),
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.person),
           title: Text('Profile')
         )
       ],
     ),
   );
 }

 void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }
}