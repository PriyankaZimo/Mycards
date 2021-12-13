import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:instagram/Util/local_storage.dart';
import 'package:instagram/profilepage/components/drawerpage1.dart';
import 'package:instagram/profilepage/loginpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = false;
  var res;
  var apilength = 0;

  @override
  void initState() {
    super.initState();
    apiHit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: DrawerPageOne(),
      backgroundColor: Color(0xFF6a61a8),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Treva',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {
            logoutApp();
          }, icon: Icon(Icons.logout))
        ],
      ),

      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemBuilder: (context, index) =>
            Stack(children: [
              Container(
                margin: EdgeInsets.only(left: 40),
                padding: EdgeInsets.all(10),
                child: Row(children: [
                  Container(
                    padding: EdgeInsets.only(left: 50),
                    height: 120,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Color(0xFF333366),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [BoxShadow(blurRadius: 2)]),
                    child: Row(children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              '${res[index]['title'].toString()}',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Rating${res[index]['rating'].toString()}',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${getData(res[index]['genre'])}',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                '${res[index]['releaseYear'].toString()}',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                ]),
              ),
              Positioned(
                top: 20,
                left: 15,
                child: Container(
                  height: 95,
                  width: 80,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(blurRadius: 5)]),
                  child: Hero(
                    tag: res[index]['image'],
                    child: Image.network(
                      res[index]['image'],
                    ),
                  ),
                ),
              ),
            ]), itemCount: apilength,
      ),
    );
  }

  Future<void> apiHit() async {
    setState(() {
      loading = true;
    });
    var url = Uri.parse('https://api.androidhive.info/json/movies.json');
    var response = await http.get(url);
    res = jsonDecode(response.body);
    print(res[1]);
    setState(() {
      apilength = res.length;
      loading = false;
    });
  }

  getData(List<dynamic> data) {
    String d = '';
    for (int i = 0; i < data.length; i++) {
      d += data[i] + ',';
    }
    return d;
  }

  void logoutApp() {

    showDialog(context: context, builder: (context) =>
        Dialog(
          backgroundColor: Colors.transparent,
          child: Container(padding: EdgeInsets.only(top: 20,left: 10,right: 10),
            height: 90,
            width: 200,
            color: Colors.white,
            child: Column(
              children: [
                Text('Are you sure to logout in this page?'),
                Row(
                  children: [
                    Spacer(),
                    TextButton(onPressed: () {
                      clearLocalData();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    }, child: Text('Yes')),
                    TextButton(onPressed: () {
                      Navigator.pop(context);
                    }, child: Text('No')),
                  ],
                )
              ],
            ),
          ),

        )
    );
  }
}
