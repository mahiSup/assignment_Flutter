import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async' show Future;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

String login_token = "";
String login_user_id = "";
String login_user_type_id = "";
String login_user_name = "";

String setting_on_click = "";
String setting_on_click_set = "";
String setting_one_click_stack = "";
String setting_stack = "";
String user_balance = "0.0";
String user_Liability = "0";
//https://dolphinbet.in/api/v1
//https://bet365days.co/api/v1/
String BASEURL = "https://dolphinbet.in/api/v1/";
String image_url = "https://99betfair.com/m/assets/loginimages/";
List leftAllSports = List();
List tv_code = List();
Map<dynamic,dynamic> UserBalanceAll = Map<dynamic,dynamic>();
Map<dynamic,dynamic> globalConstant = Map<dynamic,dynamic>();

class Constants {
  String videoString(String key){
    String html="<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n"+
        "</head>\n" +
        "<body>\n" +
        "<iframe id='fp_embed_player' src='https://t3n.crakex.in:8888/embed_player?urlServer=wss://t3n.crakex.in:8443&mediaProviders=WebRTC,Flash,MSE,WSPlayer&streamName=${key}&domain=bet365days.co&token=${login_token}' marginwidth='0' marginheight='0' frameborder='0' width='100%' height='100%' scrolling='no' allowfullscreen='allowfullscreen'></iframe>\n" +
        "\n" +
        " </body>\n" +
        "\n" +
        "</html>";
    return html;
  }
  Future<String> getLocalValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
  void setLocalValue(String key,String values) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, values);
  }

  String stringToDateToString(String strDate,String gFormate,String sFormate) {
    //print(strDate);
    var dateFormatter = DateFormat(sFormate);
    final date = dateFormatter.parse(strDate);
    //print(gFormate);
    //print(date);
    //print(DateFormat(gFormate).format(date));
    return DateFormat(gFormate).format(date);
  }
  void showAlertMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: (message.toLowerCase().contains("success")) ? Color.fromRGBO(72, 127, 32, 0.8):Color.fromRGBO(190, 84, 80, 0.8),
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  String getSplitValue(value,int index) {
    var stackList = value.split(",");
    if (stackList.length>=index) {
      return stackList[index];
    }else {
      return "0";
    }
  }
  String validateEmail(String value) {
    if (value.isEmpty) {
      // The form is empty
      return "Enter email address";
    }
    // This is just a regular expression for email addresses
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);

    if (regExp.hasMatch(value)) {
      // So, the email is valid
      return null;
    }

    // The pattern of the email didn't match the regex above.
    print("Email is not valid");
    return 'Email is not valid';
  }
}