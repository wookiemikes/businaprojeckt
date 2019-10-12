import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      PreferredSize(
          preferredSize: Size.fromHeight(65.0), // here the desired height
          child: AppBar(
             title: Text(
               "Register",
               style: TextStyle(
                 fontSize: 20.0,

               ),
             ),
            backgroundColor: Colors.greenAccent,
            elevation: 0.0,
            iconTheme: new IconThemeData(
              color: Colors.white,
              size: 35.0
            ),
          ),
      )
    );
  }
}