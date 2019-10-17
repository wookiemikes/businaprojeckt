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
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                Colors.amber[600],
                Colors.amber[900],
                Colors.amber[900],
                Colors.amber[900],
              ],
            ),
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 150.0,
                    width: 150.0,
                    child: Image.asset('lib/assets/icons/bus.png'),
                  ),
                  Container(
                    child: Text('BUSINA',
                        style: TextStyle(
                          fontFamily: 'Archivo',
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0, right: 10.0,
                ),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  OutlineButton(
                    borderSide: BorderSide(
                      color: Colors.white,
                      style: BorderStyle.solid,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserLogin(),
                          ));
                    },
                    child: Stack(
                      children: <Widget>[
                        Container(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.email,
                              color: Colors.white,
                              size: 20.0,
                            ),
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Sign in with email',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  OutlineButton(
                    borderSide: BorderSide(
                      color: Colors.white,
                      style: BorderStyle.solid,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserLogin(),
                          ));
                    },
                    child: Stack(
                      children: <Widget>[
                        Container(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.phone_android,
                              color: Colors.white,
                              size: 20.0,
                            ),
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Sign in with phone number',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
