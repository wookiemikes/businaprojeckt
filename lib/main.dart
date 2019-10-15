import 'package:flutter/material.dart';
import 'package:busina/pages/busina_user_login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BUSina',
      debugShowCheckedModeBanner: false,

      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Stack(
             children: <Widget>[
                new Container(
                height: 150.0,
                width: 150.0,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(75.0),
                  color: Colors.greenAccent,
                ),
                child: new Icon(
                  Icons.directions_bus,
                  color: Colors.white,
                  size: 100.0,
                  ),
              ),
             ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 50.0),
                  child: new Text(
                    "BUSina",
                    style: new TextStyle(fontSize: 35.0),
                  ),
                )
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0),
                    child: GestureDetector(
                      onTap: () {
                         Navigator.push(context, MaterialPageRoute(
                           builder: (context) => UserLogin(),
                         ));
                      },
                      child: new Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          decoration: new BoxDecoration(
                              color: Color(0xFF18D191),
                              borderRadius: new BorderRadius.circular(15.0)),
                          child: new Text("Sign In With Email",
                              style: new TextStyle(
                                  fontSize: 20.0, color: Colors.white))),
                    ),
                  ),
                )
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0),
                    child: new Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        decoration: new BoxDecoration(
                            color: Color(0xFF4364A1),
                            borderRadius: new BorderRadius.circular(15.0)),
                        child: new Text("Sign in With FaceBook",
                            style: new TextStyle(
                                fontSize: 20.0, color: Colors.white))),
                  ),
                ),
                
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0),
                    child: new Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        decoration: new BoxDecoration(
                            color: Color(0xFFDF513B),
                            borderRadius: new BorderRadius.circular(15.0)),
                        child: new Text("Sign in With Google",
                            style: new TextStyle(
                                fontSize: 20.0, color: Colors.white))),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
