import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class AuthScreenVC extends StatefulWidget {
  @override
  AuthScreenVCState createState() => new AuthScreenVCState();
}

class AuthScreenVCState extends State<AuthScreenVC>
    with SingleTickerProviderStateMixin {
  TextEditingController txtPassword = new TextEditingController();
  int isSetNumber = 2;
  var passwordVisible = false;
  List<String> _locations = ['A', 'B', 'C', 'D','A', 'B', 'C', 'D']; // Option 2
  String _selectedLocation1; // Option 2
  String _selectedLocation2; // Option 2
  String _selectedLocation3; // Option 2

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
        child: new SingleChildScrollView(
          child: didSetUI(),
        ),
      ),
    );
  }
  Widget didSetUI(){
    if (isSetNumber == 2) {
      return new Column(
        children: <Widget>[
          didSetBackButton(),
          didSetHeaderNumber(),
          didSetHeaderPassword(),
          didSetPassword(),
          didSetValidationUI(),
          setBottomButton(),
        ],
      );
    } else if (isSetNumber == 3) {
      return new Column(
        children: <Widget>[
          didSetBackButton(),
          didSetHeaderNumber(),
          didSetPersonalInfo(),
          setBottomButton(),
        ],
      );
    } else {
      return new Column(
          children: <Widget>[
            didSetBackButton(),
            didSetHeaderNumber(),
            didSetVideoCall(),
            setBottomButton(),
          ],
        );
    }
  }
  Widget didSetBackButton() {
    return new GestureDetector(
      onTap: () {
          Navigator.of(context).pop();
      },
      child: new Container(
        margin: EdgeInsets.fromLTRB(16, 40 , 16, 0),
        child: new Row(
          children: <Widget>[
            new Icon(Icons.arrow_back,color: Colors.white,),
            new Text("Create Account",style: new TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
  Widget didSetHeaderPassword() {
    return Align(
      alignment: Alignment.topLeft,
      child:  Container(
        //width: MediaQuery.of(context).size.width-32,
        margin: EdgeInsets.fromLTRB(16, 0 , 16, 0),
        alignment: Alignment.topLeft,
        child: new Column(
          children: <Widget>[
            new Align(
              alignment: Alignment.topLeft,
              child: new Text("Create Password",style: new TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
            ),
            new RichText(text: TextSpan(
              text: "Password will be used to login to account",style: new TextStyle(
                fontSize: 17.0,
                color: Colors.white,
                fontWeight: FontWeight.normal),
              children: <TextSpan>[
                TextSpan(
                    text: '',
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
              didSetNumber("1",isSetNumber>1?Colors.lightGreen:Colors.white),
              Spacer(),
              didSetNumber("2",isSetNumber>2?Colors.lightGreen:Colors.white),
              Spacer(),
              didSetNumber("3",isSetNumber>3?Colors.lightGreen:Colors.white),
              Spacer(),
              didSetNumber("4",isSetNumber>4?Colors.lightGreen:Colors.white),
            ],
          ),
        ],
      ),);
  }

  Widget didSetNumber(String number, Color color) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.0),
      child: Container(
        width: 50, height: 50,
        color: color,
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
        setState(() {
          isSetNumber+=1;
        });
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

  Widget didSetPassword() {
    return new Container(
      color: Color.fromRGBO(242, 242, 242, 1.0),
      margin: EdgeInsets.fromLTRB(16, 80 , 16, 0),
      height: 50,
      child: new TextField(
        controller: txtPassword,
        onChanged: onSearchTextChanged,
        obscureText: passwordVisible,
        decoration: new InputDecoration(
          hintText: "Create password",
          hintStyle: new TextStyle(
            color: Colors.black,
          ),
          suffixIcon: IconButton(icon: Icon(
            passwordVisible
                ? Icons.visibility
                : Icons.visibility_off,
            color: Colors.white,
          ),onPressed: () {
            // Update the state i.e. toogle the state of passwordVisible variable
            setState(() {
              passwordVisible = !passwordVisible;
            });
          }),
          labelText: "Password",
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

  Widget didSetValidationUI() {
    return new Container(
      margin: EdgeInsets.fromLTRB(16, 0 , 16, 0),
      child: new Column(
        children: <Widget>[
          new Align(
            alignment: Alignment.topLeft,
            child: new RichText(text: TextSpan(
              text: "Complexity : ",style: new TextStyle(
                fontSize: 17.0,
                color: Colors.white,
                fontWeight: FontWeight.normal),
              children: <TextSpan>[
                TextSpan(
                    text: ' Very Week',
                    style: TextStyle(color: Colors.orange, fontSize: 17.0,fontWeight: FontWeight.normal)),
              ],
            ) ),
          ),
          new SizedBox(height: 15.0,),
          new Row(
            children: <Widget>[
              new RichText(text: TextSpan(
                text: "a\n",style: new TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.normal),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Lowercase',
                      style: TextStyle(color: Colors.white, fontSize: 17.0,fontWeight: FontWeight.normal)),
                ],
              ) ),
              Spacer(),
              new RichText(text: TextSpan(
                text: "A\n",style: new TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.normal),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Uppercase',
                      style: TextStyle(color: Colors.white, fontSize: 17.0,fontWeight: FontWeight.normal)),
                ],
              ) ),
              Spacer(),
              new RichText(text: TextSpan(
                text: "123\n",style: new TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.normal),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Number',
                      style: TextStyle(color: Colors.white, fontSize: 17.0,fontWeight: FontWeight.normal)),
                ],
              ) ),
              Spacer(),
              new RichText(text: TextSpan(
                text: "9+\n",style: new TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.normal),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Characters',
                      style: TextStyle(color: Colors.white, fontSize: 17.0,fontWeight: FontWeight.normal)),
                ],
              ) ),
            ],
          )
        ],
      ),
    );
  }

  Widget didSetPersonalInfo() {
    return Align(
      alignment: Alignment.topLeft,
      child:  Container(
        //width: MediaQuery.of(context).size.width-32,
        margin: EdgeInsets.fromLTRB(16, 0 , 16, 0),
        alignment: Alignment.topLeft,
        child: new Column(
          children: <Widget>[
            new Align(
              alignment: Alignment.topLeft,
              child: new Text("Personal Information",style: new TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
            ),
            new RichText(text: TextSpan(
              text: "Please fill in the information below and your goal for digital saving",style: new TextStyle(
                fontSize: 17.0,
                color: Colors.white,
                fontWeight: FontWeight.normal),
              children: <TextSpan>[
                TextSpan(
                    text: '',
                    style: TextStyle(color: Colors.white, fontSize: 35.0,fontWeight: FontWeight.bold)),
              ],
            ) ),
            new SizedBox(height: 15.0,),
            new Container(
              alignment: Alignment.center,
              color: Color.fromRGBO(242, 242, 242, 1.0),
              //margin: EdgeInsets.fromLTRB(16, 80 , 16, 0),
              width: MediaQuery.of(context).size.width-32,
              height: 50,
              child: new DropdownButtonHideUnderline(child: new DropdownButton(
                hint: Text('Goal for activation'), // Not necessary for Option 1
                value: _selectedLocation1 == null ? null : _selectedLocation1,
                onChanged: (newValue) {
                  setState(() {
                    //_selectedLocation1 = newValue;
                  });
                },
                items: _locations.map((String location) {
                  return new DropdownMenuItem<String>(
                    child: new Text(location),
                    value: location,
                  );
                }).toList(),
              )),
            ),
            new SizedBox(height: 5.0,),
            new Container(
              alignment: Alignment.center,
              color: Color.fromRGBO(242, 242, 242, 1.0),
              //margin: EdgeInsets.fromLTRB(16, 80 , 16, 0),
              width: MediaQuery.of(context).size.width-32,
              height: 50,
              child: new DropdownButtonHideUnderline(child: new DropdownButton(
                hint: Text('Monthly income'), // Not necessary for Option 1
                value: _selectedLocation2 == null ? null : _selectedLocation2,
                onChanged: (newValue) {
                  setState(() {
                    //_selectedLocation2 = newValue;
                  });
                },
                items: _locations.map((location) {
                  return DropdownMenuItem(
                    child: new Text(location),
                    value: location,
                  );
                }).toList(),
              )),
            ),
            new SizedBox(height: 5.0,),
            new Container(
              alignment: Alignment.center,
              color: Color.fromRGBO(242, 242, 242, 1.0),
              //margin: EdgeInsets.fromLTRB(16, 80 , 16, 0),
              width: MediaQuery.of(context).size.width-32,
              height: 50,
              child: new DropdownButtonHideUnderline(child: new DropdownButton(
                hint: Text('Monthly expense'), // Not necessary for Option 1
                value: _selectedLocation3 == null ? null : _selectedLocation3,
                items: _locations.map((location) {
                  return DropdownMenuItem(
                    child: new Text(location),
                    value: location,
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                   // _selectedLocation3 = newValue;
                  });
                },
              ),),
            ),
          ],
        ),
      ),
    );
  }

  Widget didSetVideoCall() {
    final format = DateFormat("yyyy-MM-dd hh:mm a");

    return Align(
      alignment: Alignment.topLeft,
      child:  Container(
        //width: MediaQuery.of(context).size.width-32,
        margin: EdgeInsets.fromLTRB(16, 0 , 16, 0),
        alignment: Alignment.topLeft,
        child: new Column(
          children: <Widget>[
            new Align(
              alignment: Alignment.topLeft,
              child: new Icon(Icons.ondemand_video,color: Colors.white,),
            ),
            new SizedBox(height: 8,),
            new Align(
              alignment: Alignment.topLeft,
              child: new Text("Schedule Video Call",style: new TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
            ),
            new RichText(text: TextSpan(
              text: "Choose the date and time that you perferred. We will send a link via email to make a video call on the scheduled date and time.",style: new TextStyle(
                fontSize: 17.0,
                color: Colors.white,
                fontWeight: FontWeight.normal),
              children: <TextSpan>[
                TextSpan(
                    text: '',
                    style: TextStyle(color: Colors.white, fontSize: 35.0,fontWeight: FontWeight.bold)),
              ],
            ) ),
            new SizedBox(height: 30.0,),
            new Container(
              color: Colors.white,
              child:  DateTimeField(
                format: format,
                decoration: new InputDecoration(
                  hintText: "Select Date & Time",
                  hintStyle: new TextStyle(
                    color: Colors.black,
                  ),
                  labelText: "Date & Time",
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
                onShowPicker: (context, currentValue) async {
                  final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100));
                  if (date != null) {
                    final time = await showTimePicker(
                      context: context,
                      initialTime:
                      TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                    );
                    return DateTimeField.combine(date, time);
                  } else {
                    return currentValue;
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

}