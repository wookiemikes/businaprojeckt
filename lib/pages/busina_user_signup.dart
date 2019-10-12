import 'package:flutter/material.dart';
import 'package:busina/pages/busina_user_booking.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        backgroundColor: Colors.greenAccent,
        elevation: 0.0,
        iconTheme: new IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              child: new TextField(
                decoration: new InputDecoration(labelText: 'Input Full Name'),
              ),
            ),
            new SizedBox(
              height: 8.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              child: new TextField(
                obscureText: true,
                decoration: new InputDecoration(labelText: 'Input Password'),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              child: new TextField(
                obscureText: true,
                decoration:
                    new InputDecoration(labelText: 'Input Email Address'),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              child: new TextField(
                decoration:
                    new InputDecoration(labelText: 'Input Mobile Number'),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => UserHomePage()
                          ));
                        },
                      child: new Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          decoration: new BoxDecoration(
                              color: Color(0xFF18D191),
                              borderRadius: new BorderRadius.circular(9.0)),
                          child: new Text("Login",
                              style: new TextStyle(
                                  fontSize: 18.0, color: Colors.white))),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
