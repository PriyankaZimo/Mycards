import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/newlogin_page/container_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(child: Text('LOGIN',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)),
      ),
      backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage('https://image.shutterstock.com/image-photo/businessman-fingerprint-scan-biometric-authentication-260nw-759104368.jpg'))
            ),
            child: Column(
      children: [
            ContainerPage()
      ],
    ),
          ),
        ));
  }
}
