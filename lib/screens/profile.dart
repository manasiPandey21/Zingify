import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:zingify/models/authModel.dart';
import 'package:zingify/screens/editprofile.dart';
import 'package:zingify/screens/homePage.dart';
import '../config.dart';
import '../providers/authprovider.dart';
import '../config.dart';


class Profile extends ConsumerWidget {
   Profile({super.key});
  final picker = ImagePicker();
 String? uid;
  var _image;
  var imageUrl;
  var imagePicker;
  final _firebaseStorage = FirebaseStorage.instance;

  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController name = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  final TextEditingController interests = TextEditingController();
  final TextEditingController bio = TextEditingController();

  final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
    return FirebaseAuth.instance;
  });
  
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      
    }
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

   
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
   
  }

  Future<void> createProfileUser(String idToken) async {
    final profileBody = {
      "fid": idToken,
      "name": name.text,
      "age": age.text,
      "bio": bio.text,
      "interests": interests.text,
      "gender": gender.text,
      "mobile": mobile.text,
    };

    try {
      final url = Uri.parse(registration);
      final http.Response response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(profileBody),
      );
      final jsonResponse = jsonDecode(response.body);
      print(jsonResponse['status']);
      print("response: ${response.toString()}");
    } catch (error) {
      print("Error sending HTTP request: $error");
    }
  }
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final firebaseAuth = ref.watch(firebaseAuthProvider);
    final user = firebaseAuth.currentUser;
    if (user == null) {
      print("User is not authenticated.");
      return Scaffold(body: Center(child: Text("User not authenticated.")));
    }
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
                    // CircleAvatar(
                    //   radius: 60.0,
                    //   backgroundImage: AssetImage('assets/dating.png'),
                    // ),
                    ProfileImage(context),
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
                              onSaved: (value) {},
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
                              onPressed: () async {
                                final firebaseAuth =
                                    ref.read(firebaseAuthProvider);
                                final user = firebaseAuth.currentUser;

                                if (user != null) {
                                  String? idToken = user.uid;

                                  createProfileUser(idToken!);
                                } else {
                                  print("error occurred");
                                }
                                if (_image != null) {
                                  String? idToken = user!.uid;
                                  var snapshot = await _firebaseStorage
                                      .ref()
                                      .child('UserPhotos/$idToken')
                                      .putFile(_image);
                                  var downloadUrl =
                                      await snapshot.ref.getDownloadURL();
                                
                                    
                                      imageUrl = downloadUrl;
                                    
                                  }
                                

                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(builder: (context) {
                                  return HomePage();
                                }), (route) => false);
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

  Widget ProfileImage(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 80,
            backgroundImage: _image != null
                ? FileImage(File(_image!.path))
                : AssetImage("assets/dating.png") as ImageProvider,
          ),
          Positioned(
            bottom: 20,
            right: 40,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context, builder: ((builder) => BottomSheet(context)));
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
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

  Widget BottomSheet(BuildContext context){
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(children: [
        Text(
          "Choose Profile Photo",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent),
                onPressed: () {
                  getImageFromCamera();
                },
                icon: Icon(Icons.camera_alt),
                label: Text("Camera")),
            SizedBox(
              width: 70,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent),
                onPressed: () {
                  getImageFromGallery();
                },
                icon: Icon(Icons.image),
                label: Text("Gallary")),
          ],
        )
      ]),
    );
  }
}
