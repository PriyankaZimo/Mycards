import 'dart:io';
import 'package:flutter/material.dart';
import 'package:instagram/newlogin_page/login_page.dart';
import 'package:instagram/profilepage/components/homepage.dart';
import 'package:instagram/profilepage/components/splashscreen.dart';
import 'package:instagram/provider/provider_page.dart';
import 'package:provider/provider.dart';
void main() {
  HttpOverrides.global=MyHttpOverrides();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Instagram',

      theme: ThemeData(),

      home:ChangeNotifierProvider(create: (context)=>ProviderPage(),child:  LoginPage() ,)


    );
  }

}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
