import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'AuthScreenVC.dart';
import 'Constants.dart';

class AuthScreen extends StatefulWidget {
  @override
  AuthScreenState createState() => new AuthScreenState();
}

class AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController txtEmail = new TextEditingController();

  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.blueAccent,
        child: new Column(
          children: <Widget>[
            didSetHeaderNumber(),
            didSetWelcome(),
            didSetEmail(),
            setBottomButton(),
          ],
        ),
      ),
    );
  }
  Widget didSetWelcome() {
    return Align(
      alignment: Alignment.topLeft,
      child:  Container(
        width: MediaQuery.of(context).size.width-32,
        margin: EdgeInsets.fromLTRB(16, 60 , 16, 0),
        alignment: Alignment.topLeft,
        child: new Column(
          children: <Widget>[
            new Text("Welcome to",style: new TextStyle(
                fontSize: 35.0,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
            new RichText(text: TextSpan(
              text: "GIN",style: new TextStyle(
                fontSize: 35.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                    text: ' Finans',
                    style: TextStyle(color: Colors.white, fontSize: 35.0,fontWeight: FontWeight.bold)),
              ],
            ) ),
          ],
        ),
      ),
    );
  }
  Widget didSetHeaderNumber() {
    return new Container(width: MediaQuery.of(context).size.width-40,height: 50,
      margin: EdgeInsets.fromLTRB(16, 80 , 16, 0),
      child: Stack(
      children: <Widget>[
        new Container(
          margin: EdgeInsets.fromLTRB(0, 24 , 0, 0),
          color: Colors.black,
          height: 2,
        ),
        new Row(
          children: <Widget>[
            didSetNumber("1"),
            Spacer(),
            didSetNumber("2"),
            Spacer(),
            didSetNumber("3"),
            Spacer(),
            didSetNumber("4"),
          ],
        ),
      ],
    ),);
  }

  Widget didSetNumber(String number) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.0),
      child: Container(
        width: 50, height: 50,
        color: Colors.white,
        /*decoration:BoxDecoration(
          border: Border.all(color: Colors.black)
        ),*/
        child: Center(
          child: new Text("${number}",
              style: new TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.normal)),
        ),
      ),
    );
  }

  Widget setBottomButton() {
    return new GestureDetector(
      onTap: () {
        if(txtEmail.text.length <1){
          //Constants().validateEmail("${txtEmail.text}");
          Constants().showAlertMessage("Please enter Email Address");
          return;

        }
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => AuthScreenVC())
        );
      },
      child: new Container(
        width: MediaQuery.of(context).size.width-32,
        height: 40,
        margin: EdgeInsets.fromLTRB(16, 50 , 16, 8),
        color: Color.fromRGBO(242, 242, 242, 1.0),
        child: new Center(
          child: new Text("Next",style: new TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget didSetEmail() {
    return new Container(
      color: Color.fromRGBO(242, 242, 242, 1.0),
      margin: EdgeInsets.fromLTRB(16, 80 , 16, 0),
      height: 50,
      child: new TextField(
        controller: txtEmail,
        onChanged: onSearchTextChanged,
        decoration: new InputDecoration(
          prefixIcon: Icon(Icons.email,color: Colors.black,),
          hintText: "Enter email",
          hintStyle: new TextStyle(
            color: Colors.black,
          ),
          prefixStyle: new TextStyle(
            color: Colors.black,
          ),
          labelText: "Email",
          labelStyle: new TextStyle(
            color: Colors.black,
            //backgroundColor: Colors.black12,
          ),
          border:OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(1.0),
          ),
        ),
      ),
    );
  }
  onSearchTextChanged(String text) async {
    print("onSearchTextChanged ${text}");
  }
}