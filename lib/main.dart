import 'package:flutter/material.dart';  
import 'package:flutter/cupertino.dart';
import 'package:sampleflutter/gets/logins.dart';
 
 
void main() async{ 
  runApp(MyApp());
}

class MyApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: "DreamDay", 
      theme: ThemeData(
       
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: Loginss( ),
    );
  }
}

