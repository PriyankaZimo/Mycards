import 'dart:async';
import 'package:flutter/material.dart';
import 'package:instagram/Util/local_storage.dart';
import 'package:instagram/profilepage/components/homepage.dart';
import 'package:instagram/profilepage/loginpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    Future.delayed(Duration(seconds: 2), () {
      route(context);
    });
  }

  route(BuildContext context) async {
    var id = await getUID();
    if(id==null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
   else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(

        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top:100),

              child: ClipOval(
                child: Image.network(
                    'https://media3.giphy.com/media/UvQcWeJFz8hKNiDRsy/giphy.gif'),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Text('Splash Screen'),
            Padding(padding: EdgeInsets.only(top: 20)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
