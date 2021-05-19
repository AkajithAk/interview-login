import 'package:flutter/material.dart'; 
import 'package:shared_preferences/shared_preferences.dart';

import 'Home.dart';
class Loginss extends StatefulWidget {
  @override
  _LoginssState createState() => _LoginssState();
}

class _LoginssState extends State<Loginss> {

  final usernameC=TextEditingController();
  final passwC=TextEditingController();
  SharedPreferences logindata;
  bool newuser;

  @override
  void initState() { 
    super.initState();
    already_sign_in();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text("Login"),centerTitle: true,),
      body: Container(
        child: Center(child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
            child: TextField(
              controller: usernameC,
              decoration: InputDecoration(
                hintText: "User Id",
                contentPadding: const EdgeInsets.all(1),
                hintStyle: TextStyle(
                  color: Colors.grey
                )
              ),
            ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
            child: TextField( 
              controller: passwC,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                contentPadding: const EdgeInsets.all(1),
                hintStyle: TextStyle(
                  color: Colors.grey
                )
              ),
            ),
            ),

            RaisedButton(
               child: Text("Login"),
              onPressed: (){
              String name=usernameC.text;
              String pwd=passwC.text;

              if(name !=""&&pwd !=""){
                 print("success");
                 logindata.setBool("login", false);
                 logindata.setString("name", name);
      Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context)=>Home()));
                 

              }
            })
            
        ],),),
      ),
 
    );
  }

  void already_sign_in()async{
    logindata=await SharedPreferences.getInstance();
    newuser=(logindata.getBool("login")??true);

    print(newuser);
    if(newuser==false){
      Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context)=>Home()));
    }
  }

  @override
  void dispose(){
    usernameC.dispose();
    passwC.dispose();
    super.dispose();
  }
}