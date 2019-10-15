import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:busina/pages/busina_user_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String _email, _password, _confirmpass, _name, _contact;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              child: new TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Please enter your name';
                  }
                },
                onSaved: (input) => _name = input,
                decoration: new InputDecoration(labelText: 'Full Name'),
              ),
            ),
            new SizedBox(
              height: 8.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              child: new TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Please enter an email';
                  }
                },
                onSaved: (input) => _email = input,
                decoration: new InputDecoration(labelText: 'Email'),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              child: new TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Please enter a mobile number';
                  }
                },
                onSaved: (input) => _contact = input,
                decoration: new InputDecoration(labelText: 'Mobile Number'),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              child: new TextFormField(
                validator: (input) {
                  if (input.length < 6) {
                    return 'Your password needs to be atleast 6 characters';
                  }
                },
                onSaved: (input) => _confirmpass = input,
                obscureText: true,
                decoration: new InputDecoration(labelText: 'Confirm Password'),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: signUp,
                      child: new Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          decoration: new BoxDecoration(
                              color: Color(0xFF18D191),
                              borderRadius: new BorderRadius.circular(9.0)),
                          child: new Text("Register",
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

  void signUp() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      if (_password == _confirmpass) {
        try {
          final FirebaseAuth _auth = FirebaseAuth.instance;
          final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
            email: _email,
            password: _password,
          ))
              .user;
          user.sendEmailVerification();

          UserUpdateInfo info = new UserUpdateInfo();
          info.displayName = _name;
          user.updateProfile(info);

          Firestore.instance.collection('users_db').document().setData({
            'name': _name,
            'uid': user.uid,
            'email': _email,
            'isEmailVerified': user.isEmailVerified,
            'photoUrl': user.photoUrl,
            'contact': _contact,
          });

          Navigator.of(context).pop();
        } catch (error) {
          print(error.code);
          if (error.code == 'ERROR_WEAK_PASSWORD') {
            toastShow('Password too weak', Colors.orange);
          } else if (error.code == 'ERROR_INVALID_EMAIL') {
            toastShow('Invalid email', Colors.orange);
          } else if (error.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
            toastShow('Email already in use', Colors.orange);
          }
        }
      } else {
        toastShow('Password does not match', Colors.red);
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
