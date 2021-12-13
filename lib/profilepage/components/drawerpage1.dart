import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/Util/local_storage.dart';

class DrawerPageOne extends StatefulWidget {
  const DrawerPageOne({Key? key}) : super(key: key);

  @override
  _DrawerPageOneState createState() => _DrawerPageOneState();
}

class _DrawerPageOneState extends State<DrawerPageOne> {
  String name='';
  String cont='';
  String data='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserName();
    getPhone();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                          'assets/download (3).jpeg')),),
              padding: EdgeInsets.all(10),
              child: Container(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 42,
                      backgroundImage: AssetImage('assets/download (1).jpeg'),
                    ),


                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                        cont,
                      style: TextStyle(
                        color: Colors.white,fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      data,
                      style: TextStyle(
                          color: Colors.white,fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ),
          Column(
            children: [
              Row(
                children: [
                  Icon(Icons.inbox,color: Colors.blue,),
                  SizedBox(width: 10,),
                  Text('Inbox'),
                ],
              ),
              SizedBox(height:20,),
              Row(
                children: [
                  Icon(Icons.send,color: Colors.blue,),
                  SizedBox(width: 10,),
                  Text('Sent'),
                ],
              ),
              SizedBox(height:20,),
              Row(
                children: [
                  Icon(Icons.drafts,color: Colors.blue,),
                  SizedBox(width: 10,),
                  Text('Draft'),
                ],
              ),
              SizedBox(height:20,),
              Row(
                children: [
                  Icon(Icons.contacts,color: Colors.blue,),
                  SizedBox(width: 10,),
                  Text('My Contacts'),
                ],
              ),
              SizedBox(height:20,),
              Row(
                children: [
                  Icon(Icons.settings,color: Colors.blue,),
                  SizedBox(width: 10,),
                  Text('Setting'),
                ],
              ),
              SizedBox(height:20,),
              Row(
                children: [
                  Icon(Icons.logout,color: Colors.blue,),
                  SizedBox(width: 10,),
                  Text('Logout'),
                ],
              )
            ],
          )
          ],
        ),
      ),
    );
  }
  Future<void> getUserName() async {
    name=await getName();
    setState(() {

    });
  }
  Future<void> getPhone() async {
    cont=await getC();
    setState(() {
    });
  }
  Future<void> getData() async {
    data=await getO();
    setState(() {
    });
  }
}

