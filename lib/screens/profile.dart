import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:zingify/screens/editprofile.dart';
import '../config.dart';
import '../providers/authprovider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../config.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController name = new TextEditingController();
  TextEditingController age = new TextEditingController();
  TextEditingController gender = new TextEditingController();
  TextEditingController mobile = new TextEditingController();
  TextEditingController interests = new TextEditingController();
  TextEditingController bio = new TextEditingController();

  void createprofileUser() async {
    var profileBody = {
      "name": name.text,
      "age": age.text,
      "bio": bio.text,
      "interests": interests.text,
      "gender": gender.text,
      "mobile": mobile.text
    };

    try {
      print("url" + Uri.parse(url).toString());
      var response = await http.post(Uri.parse(registration),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(profileBody));
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse['status']);
      print("response" + response.toString());
    } catch (error) {
      print("Error sending HTTP request: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    //final auth = ref.watch(autheticationProvider);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Color(0xff212121),
            body: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 40.0,
                      width: 150.0,
                    ),
                    CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage('assets/dating.png'),
                    ),
                    SizedBox(
                      height: 20.0,
                      width: 150.0,
                    ),
                    Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            child: TextFormField(
                              controller: name,
                              autocorrect: true,
                              enableSuggestions: true,
                              keyboardType: TextInputType.name,
                              onSaved: (value) {},
                              decoration: InputDecoration(
                                hintText: 'name',
                                hintStyle: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                icon: Icon(Icons.man,
                                    color: Colors.pinkAccent, size: 24),
                                alignLabelWithHint: true,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            child: TextFormField(
                              controller: age,
                              autocorrect: true,
                              enableSuggestions: true,
                              keyboardType: TextInputType.number,
                              onSaved: (value) {},
                              decoration: InputDecoration(
                                hintText: 'age',
                                hintStyle: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                icon: Icon(Icons.calendar_month,
                                    color: Colors.pinkAccent, size: 24),
                                alignLabelWithHint: true,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            child: TextFormField(
                              controller: bio,
                              autocorrect: true,
                              enableSuggestions: true,
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (value) {},
                              decoration: InputDecoration(
                                hintText: 'bio',
                                hintStyle: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                icon: Icon(Icons.gif_box,
                                    color: Colors.pinkAccent, size: 24),
                                alignLabelWithHint: true,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            child: TextFormField(
                              controller: interests,
                              autocorrect: true,
                              enableSuggestions: true,
                              keyboardType: TextInputType.name,
                              onSaved: (value) {},
                              decoration: InputDecoration(
                                hintText: 'dancing,party...',
                                hintStyle: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                icon: Icon(Icons.favorite,
                                    color: Colors.pinkAccent, size: 24),
                                alignLabelWithHint: true,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            child: TextFormField(
                              controller: gender,
                              autocorrect: true,
                              enableSuggestions: true,
                              keyboardType: TextInputType.name,
                              onSaved: (value) {
                                createprofileUser();
                              },
                              decoration: InputDecoration(
                                hintText: 'gender',
                                hintStyle: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                icon: Icon(Icons.man,
                                    color: Colors.pinkAccent, size: 24),
                                alignLabelWithHint: true,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            child: TextFormField(
                              controller: mobile,
                              autocorrect: true,
                              enableSuggestions: true,
                              keyboardType: TextInputType.phone,
                              onSaved: (value) {},
                              decoration: InputDecoration(
                                hintText: '9556181283',
                                hintStyle: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                icon: Icon(Icons.man,
                                    color: Colors.pinkAccent, size: 24),
                                alignLabelWithHint: true,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  backgroundColor: Colors.pinkAccent),
                              onPressed: () {
                                createprofileUser();
                              },
                              child: Text(
                                "SAVE",
                                style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.white,
                                    fontFamily: 'Source Sans Pro'),
                              )),
                          Card(
                            color: Color(0xff373737),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 25.0),
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditProfile()));
                              },
                              leading: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                              title: Text(
                                'Edit',
                                style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.white,
                                    fontFamily: 'Source Sans Pro'),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Card(
                            color: Color(0xff373737),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 25.0),
                            child: ListTile(
                              onTap: () {
                                // showAlertDialog(context);
                                //auth.signOut();
                              },
                              leading: Icon(
                                Icons.logout,
                                color: Colors.white,
                              ),
                              title: Text(
                                'Logout',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 17.0,
                                ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )),
                    ),
                  ]),
            ))));
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = Row(
    children: [
      TextButton(
        child: Text("Yes"),
        onPressed: () {},
      ),
      TextButton(
        child: Text("No"),
        onPressed: () => Navigator.pop(context),
      )
    ],
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Logout"),
    content: Text("Are you sure you want to Logout?"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
