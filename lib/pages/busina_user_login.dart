import 'package:flutter/material.dart';
import 'package:busina/pages/busina_user_signup.dart';
import 'package:busina/pages/busina_user_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: new IconThemeData(color: Color(0xFF18D191))),
      body: Form(
        key: _formKey,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Stack(
              children: <Widget>[
                new Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(60.0),
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: new TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Please enter an email';
                  } else if (input.indexOf('@') <= 0){
                    return 'Please enter valid email';
                  }
                },
                onSaved: (input) => _email = input,
                decoration: new InputDecoration(labelText: 'Email'),
              ),
            ),
            new SizedBox(
              height: 10.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: new TextFormField(
                validator: (input) {
                  if (input.length < 6) {
                    return 'Your password needs to be atleast 6 characters';
                  }
                },
                onSaved: (input) => _password = input,
                obscureText: true,
                decoration: new InputDecoration(labelText: 'Password'),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 5.0, top: 10.0),
                    child: GestureDetector(
                      onTap: signIn,
                      child: new Container(
                          alignment: Alignment.center,
                          height: 30.0,
                          decoration: new BoxDecoration(
                              color: Color(0xFF18D191),
                              borderRadius: new BorderRadius.circular(9.0)),
                          child: new Text("Login",
                              style: new TextStyle(
                                  fontSize: 12.0, color: Colors.white))),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 20.0, top: 10.0),
                    child: new Container(
                        alignment: Alignment.center,
                        height: 30.0,
                        child: new Text("Forgot Password?",
                            style: new TextStyle(
                                fontSize: 10.0, color: Color(0xFF18D191)))),
                  ),
                )
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupPage()));
                      },
                      child: new Text("Create A New Account ",
                          style: new TextStyle(
                              fontSize: 15.0,
                              color: Color(0xFF18D191),
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        AuthResult user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => UserHomePage()));
      } catch (error) {
        print(error.code);
        if (error.code == 'ERROR_WRONG_PASSWORD') {
          toastShow('password is invalid', Colors.orange);
        } else if (error.code == 'ERROR_INVALID_EMAIL') {
          toastShow('email is incorrect', Colors.orange);
        } else if (error.code == 'ERROR_USER_NOT_FOUND') {
          toastShow('No user found', Colors.red);
        } else if (error.code == 'ERROR_TOO_MANY_REQUESTS') {
          toastShow('Too many attempts, Try again later', Colors.red);
        } else {
          toastShow('No internet access', Colors.red);
        }
      }
    }
  }

  void toastShow(txt, colr) {
    Fluttertoast.showToast(
        msg: txt,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: colr,
        textColor: Colors.white,
        fontSize: 14.0);
  }
}
