import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final db = Firestore.instance;
  String _email, _password, _confirmpass, _name, _contact;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        elevation: 0.0,
        iconTheme: new IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1,0.5,0.7,0.9],
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontFamily: 'Archivo',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 50.0
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[100].withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.white,

                            ),
                            validator: (input) {
                              if (input.isEmpty) {
                                return 'Please enter your name';
                              }
                            },
                            onSaved: (input) => _name,
                            decoration: new InputDecoration(
                              contentPadding: EdgeInsets.symmetric( vertical: 5),
                              border: InputBorder.none,
                              labelText: 'Full name',
                              labelStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[100].withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.white,

                            ),
                            validator: (input) {
                              if (input.isEmpty) {
                                return 'Please enter an email';
                              } else if (input.lastIndexOf('@') <= 0) {
                                return 'Please enter valid email';
                              }
                            },
                            onSaved: (input) => _email,
                            decoration: new InputDecoration(
                              contentPadding: EdgeInsets.symmetric( vertical: 5),
                              border: InputBorder.none,
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[100].withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.white,

                            ),
                            validator: (input) {
                              if (input.isEmpty) {
                                return 'Please enter a mobile number';
                              }
                            },
                            onSaved: (input) => _contact,
                            decoration: new InputDecoration(
                              contentPadding: EdgeInsets.symmetric( vertical: 5),
                              border: InputBorder.none,
                              labelText: 'Mobile Number',
                              labelStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[100].withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.white,

                            ),
                            validator: (input) {
                              if (input.isEmpty) {
                                return 'Your password needs to be atleast 6 characters';
                              }
                            },
                            onSaved: (input) => _password,
                            obscureText: true,
                            decoration: new InputDecoration(
                              contentPadding: EdgeInsets.symmetric( vertical: 5),
                              border: InputBorder.none,
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[100].withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.white,

                            ),
                            validator: (input) {
                              if (input.isEmpty) {
                                return 'Your password needs to be atleast 6 characters';
                              }
                            },
                            onSaved: (input) => _confirmpass,
                            obscureText: true,
                            decoration: new InputDecoration(
                              contentPadding: EdgeInsets.symmetric( vertical: 5),
                              border: InputBorder.none,
                              labelText: 'Re-enter Password',
                              labelStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                         Container(
                          width: double.infinity,
                          height: 45.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3.0)),
                          child: FlatButton(
                            textColor: Colors.amber[900],
                            onPressed: signUp,
                            child: Text('SUBMIT'),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        )
      )
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
          )) .user;
          user.sendEmailVerification();

          UserUpdateInfo info = new UserUpdateInfo();
          info.displayName = _name;
          user.updateProfile(info);

          db.collection('users_db').document().setData({
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
