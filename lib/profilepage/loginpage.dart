import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:instagram/Util/local_storage.dart';
import 'package:instagram/profilepage/components/homepage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var res;
  var apilength = 0;
  bool loading = false, hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Color(0xFF1A237E),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(180),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Column(children: [
                    Text(
                      'LOGIN',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A237E)),
                    ),
                    Container(
                      width: 150,
                      height: 1,
                      color: Color(0xFF1A237E),
                    )
                  ]),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 10,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email Id',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: emailController,
                          style: TextStyle(color: Colors.white),
                          validator: (val) {
                            if (val.toString().isEmpty)
                              return 'enter email address';
                            else
                              null;
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.black12,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              contentPadding: EdgeInsets.zero,
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.mail,
                                  color: Colors.white,
                                ),
                              ),
                              hintText: 'Username',
                              hintStyle: TextStyle(color: Colors.white)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Password',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: passwordController,
                          obscureText: hidePassword,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              fillColor: Colors.black12,
                              filled: true,
                              counterText: '',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              contentPadding: EdgeInsets.zero,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
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
                                icon: Icon(
                                  hidePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.white)),
                          validator: (val) {
                            if (val.toString().isEmpty)
                              return 'Enter password';
                            else if (val.toString().length < 6)
                              return 'Enter password minimum 6 ';
                            else if (val.toString().length > 15)
                              return 'Enter passwor maximim 15';
                            else
                              null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        loading == true
                            ? CircularProgressIndicator()
                            : GestureDetector(
                                onTap: () {
                                  if (formKey.currentState!.validate())
                                    apihit();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 350,
                                  decoration: BoxDecoration(
                                      color: Colors.indigoAccent,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black38,
                                          blurRadius: 20,
                                        )
                                      ]),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                      ]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
                child: Text(
                  'Forget Password?',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 1,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'or',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 100,
                    height: 1,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 120),
                child: Image.network(
                  'https://assets.wordstream.com/s3fs-public/styles/simple_image/public/images/facebook-logo-stats-2018.png?xnmV_wKuqClXX297l4IsIMmIYZJZrktk&itok=NuRNkmk0',
                  scale: 4,
                ),
              ),
              SizedBox(
                height: 110,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Dont have an account? Sign in.',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  apihit() async {
    setState(() {
      loading = true;
    });
    var url = Uri.parse('https://theratap.com:1337/api/v1/user/login');
    var response = await (http.post(url, body: {
      "email": emailController.text,
      "password": passwordController.text,
    }).timeout(Duration(seconds: 10)));
    print(response.body);
    res = jsonDecode(response.body);
    showMessage(res['message']);
    if (res['code'] == 200) {
      saveUserId(
          res['data']['userInfo']['_id'],
          res['data']['userInfo']['firstName'],
          res['data']['userInfo']['lastName'],
          res['data']['userInfo']['mobile_no'],
          res['data']['userInfo']['email']);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
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
