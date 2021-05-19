import 'package:flutter/material.dart';
import 'package:sampleflutter/gets/logins.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 SharedPreferences logindata;
 String username;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial()async{
    logindata=await SharedPreferences.getInstance();
    setState(() {
      username=logindata.getString("name");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),centerTitle: true,),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text("$username" ,style: TextStyle(fontSize: 32),),
        SizedBox(height:10),
        RaisedButton(
          child: Text("Logout"),
          onPressed: (){
          logindata.setBool("login",true);
          Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context)=>Loginss()));
        })

      ],),),
    );
  }
}