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
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
          backgroundColor: Colors.amber[600],
          elevation: 0.0,
          iconTheme: new IconThemeData(color: Colors.white)),
      body: Container(
        alignment: Alignment.center,
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 150.0,
                  width: 150.0,
                  child: Image.asset('lib/assets/icons/bus.png'),
                ),
                Container(
                  child: Text(
                    'BUSINA',
                    style: TextStyle(
                      fontFamily: 'Archivo',
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 100.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                                return 'Please enter an email';
                              } else if (input.indexOf('@') <= 0) {
                                return 'Please enter valid email';
                              }
                            },
                            onSaved: (input) => _email = input,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 5),
                                border: InputBorder.none,
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                )),
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
                              if (input.length < 6) {
                                return 'Your password needs to be atleast 6 characters';
                              }
                            },
                            onSaved: (input) => _password = input,
                            obscureText: true,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 5),
                                border: InputBorder.none,
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                )),
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
                            onPressed: signIn,
                            child: Text('LOGIN'),
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              FlatButton(
                                padding: EdgeInsets.only(
                                  left: 0.0,
                                ),
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onPressed: signIn,
                                child: Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              FlatButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignupPage()));
                                },
                                child: Text(
                                  'SIGN UP',
                                  style: TextStyle(
                                    color: Colors.white,
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
          ],
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Container(
              color: Color(0xFF18D191),
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Color(0xFF18D191),
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              ),
            );
          });
      try {
        AuthResult user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.pop(context);
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
        Navigator.pop(context);
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
