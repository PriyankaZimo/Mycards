import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/provider/provider_page.dart';
import 'package:provider/provider.dart';

class ContainerPage extends StatelessWidget {
  ProviderPage?_provider;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _provider=context.read<ProviderPage>();
    return Stack(clipBehavior: Clip.none, children: [
      Positioned(
        top: 290,
        left: 130,
        child: Consumer<ProviderPage>(
          builder: (context, value, child){
            return value.loading?Center(child: CircularProgressIndicator()):
            GestureDetector(
          onTap: () {
            _provider!.apiTest(emailController.text.toString(),passwordController.text.toString());
          },
          child: Container(
            alignment: Alignment.center,
            height: 70,
            width: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Text(
              'login',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          ),);}
        ),
      ),
      Container(
          padding: EdgeInsets.only(bottom: 60, top: 60),
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(top: 60, right: 10, left: 10),
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white38,
            ),
            child: Column(children: [
                TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      fillColor: Colors.black12,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Enter emal id',
                      hintStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      fillColor: Colors.black12,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Enter Passsword ',
                      hintStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 30,
                ),
              ]),

          )),
    ]);
  }
}
