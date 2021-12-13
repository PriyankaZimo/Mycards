import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var numberController = TextEditingController();
  var confirmController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var res;
  var apilength = 0;
  bool loading = false, hidePassword1 = true, hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5C6BC0),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 780,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(200),
            ),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF5C6BC0), Color(0xFF1A237E)]),
          ),
          padding: EdgeInsets.only(left: 50, right: 50),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Here to get \n Welcomed !",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: firstnameController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: ('First Name'),
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: ('Enter correct name'),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintStyle: (TextStyle(color: Colors.white))),
                  validator: (value) {
                    if (value.toString().isEmpty)
                      return ('Enter correct name');
                    else if (value.toString().length < 2)
                      return ('name not long enough');
                    null;
                  },
                ),
                SizedBox(
                  height: 10,

                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: lastnameController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: ('Last Name'),
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: ('Enter correct name'),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintStyle: (TextStyle(color: Colors.white))),
                  validator: (value) {
                    if (value.toString().isEmpty)
                      return ('Enter correct name');
                    else if (value.toString().length < 2)
                      return ('name not long enough');
                    null;
                  },
                ),
                SizedBox(height: 10,),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: emailController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: ('Email'),
                      hintText: ('Please Enter email'),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: (TextStyle(color: Colors.white))),
                  validator: (value) {
                    if (value.toString().isEmpty)
                      return ('Enter correct email');
                    else
                      null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  maxLength: 10,
                  maxLengthEnforced: true,
                  controller: numberController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      counterText: " ",
                      labelText: (' Contact Number'),
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: (' Please Enter number'),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintStyle: (TextStyle(color: Colors.white))),
                  validator: (value) {
                    if (value.toString().length < 9)
                      return ('Please enter valid number');
                    else
                      null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  obscureText: hidePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: passwordController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: ('Password'),
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: ('Please Enter password'),
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          hidePassword;
                          hidePassword
                              ? hidePassword = false
                              : hidePassword = true;
                        });
                      },
                      color: Colors.white,
                      icon: Icon(hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintStyle: (TextStyle(color: Colors.white)),
                  ),
                  validator: (value) {
                    if (value.toString().isEmpty)
                      return ('Enter correct password');
                    else if (value.toString().length < 6)
                      return ('Enter password minimum 6');
                    else
                      null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  obscureText: hidePassword,
                  controller: confirmController,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: ('Confirm Password'),
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: ('Please re-enter password'),
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            hidePassword1
                                ? hidePassword1 = false
                                : hidePassword1 = true;
                          });
                        },
                        color: Colors.white,
                        icon: Icon(hidePassword1
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintStyle: (TextStyle(color: Colors.white))),
                  validator: (value) {
                    if (value.toString().isEmpty)
                      return ('Plaease Enter re-password');
                    else if (value.toString().length < 6)
                      return ('Enter minimum password length 6');
                    else
                      null;
                  },
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    RawMaterialButton(
                      onPressed: () {
                        apihitTest();
                      },
                      elevation: 2.0,
                      fillColor: Colors.white,
                      child: loading
                          ? SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(
                                color: Colors.green,
                                strokeWidth: 3,
                              ))
                          : Icon(
                              Icons.arrow_forward,
                              size: 30,
                              color: Color(0xFF1A237E),
                            ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    )
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sign in',
                      style: TextStyle(color: Colors.white),
                    ),
                    Spacer(),
                    Text(
                      'Forgot password?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> apihitTest() async {
    setState(() {
      loading = true;
    });
    var url = Uri.parse('http://192.168.1.100:8000/api/v1/register');
    var response = await (http.post(url, body: {
      "firstName":firstnameController.text,
      "lastName":lastnameController.text,
      "email": emailController.text,
      "confirm":confirmController.text,
      "password": passwordController.text,
    }).timeout(Duration(seconds:5)));
    print(response.body);
    res = jsonDecode(response.body);
    showMessage(res['message']);
    if (res['code'] == 200) {
      print('correct');
    }
    print(res[1]);
    setState(() {
      loading = false;
    });
  }

  showMessage(String message) {
    final snackBar = SnackBar(content: Text(message));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
