import 'dart:convert';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../config.dart';
import '../models/userModel.dart';

final bool isEdit = false;

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController name = new TextEditingController();
  TextEditingController age = new TextEditingController();
  TextEditingController gender = new TextEditingController();
  TextEditingController mobileNo = new TextEditingController();
  TextEditingController interests = new TextEditingController();
  TextEditingController bio = new TextEditingController();
  //final picker = ImagePicker();
  UserModel? currUser;
  UserModel? newUser;
  bool _isInit = true;
  bool isLoading = true;
  final picker = ImagePicker();
  String? uid;
  var _image;
  var imageUrl;
  var imagePicker;
  final _firebaseStorage = FirebaseStorage.instance;
  //final _firebaseStorage = FirebaseStorage.instance;
  List<String> genderOptions = ['Men', 'Women', 'Others'];
  String selectedGender = 'Men';
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

  Future<void> updateUserProfile(
      String userId, Map<String, dynamic> updatedData) async {
    final url = Uri.parse('http://192.168.200.146/update/$userId');

    try {
      final response = await http.patch(
        url,
        body: updatedData,
        headers: {
          'Content-Type': 'application/json', // Set the content type
        },
      );

      if (response.statusCode == 200) {
        // Profile updated successfully
        print('Profile updated successfully');
      } else {
        // Handle errors or show an error message to the user
        print('Failed to update profile: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network or other errors
      print('Error updating profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Color.fromARGB(255, 238, 227, 231),
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              shadowColor: Colors.grey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Hey! It's Me",
                      style: GoogleFonts.aBeeZee(
                          fontSize: 50, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ProfileImage(context),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                          tileColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          focusColor: Colors.pink.shade100,
                          leading: Icon(
                            Icons.man_2_rounded,
                            color: Colors.pinkAccent,
                          ),
                          title: Text(
                            'Name: ',
                            style: GoogleFonts.aBeeZee(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          trailing: Icon(
                            Icons.edit,
                            color: Colors.pinkAccent,
                          ),
                          onTap: () {
                            setState(() {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                    ),
                                  ),
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: Wrap(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              controller: name,
                                              decoration: InputDecoration(
                                                  hintText: "Name",
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20))),
                                              keyboardType: TextInputType.name,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("UPDATE"),
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                backgroundColor:
                                                    Colors.pinkAccent),
                                          ),
                                        )
                                      ]),
                                    );
                                  });
                            });
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          tileColor: Colors.white,
                          leading: Icon(
                            Icons.calendar_month_rounded,
                            color: Colors.pinkAccent,
                          ),
                          title: Text(
                            'Age: ',
                            style: GoogleFonts.aBeeZee(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          trailing: Icon(
                            Icons.edit,
                            color: Colors.pinkAccent,
                          ),
                          onTap: () {
                            setState(() {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                    ),
                                  ),
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: Wrap(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              controller: age,
                                              decoration: InputDecoration(
                                                  hintText: "Age",
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20))),
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: Text("UPDATE"),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.pinkAccent,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20))),
                                          ),
                                        )
                                      ]),
                                    );
                                  });
                            });
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          tileColor: Colors.white,
                          leading: Icon(
                            Icons.add_comment,
                            color: Colors.pinkAccent,
                          ),
                          title: Text(
                            'Bio: ',
                            style: GoogleFonts.aBeeZee(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          trailing: Icon(
                            Icons.edit,
                            color: Colors.pinkAccent,
                          ),
                          onTap: () {
                            setState(() {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                    ),
                                  ),
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: Wrap(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              controller: bio,
                                              decoration: InputDecoration(
                                                  hintText: "Bio",
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20))),
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: Text("UPDATE"),
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                backgroundColor:
                                                    Colors.pinkAccent),
                                          ),
                                        )
                                      ]),
                                    );
                                  });
                            });
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          tileColor: Colors.white,
                          leading: Icon(
                            Icons.favorite,
                            color: Colors.pinkAccent,
                          ),
                          title: Text(
                            'Interests: ',
                            style: GoogleFonts.aBeeZee(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          trailing: Icon(
                            Icons.edit,
                            color: Colors.pinkAccent,
                          ),
                          onTap: () {
                            setState(() {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                    ),
                                  ),
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: Wrap(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              controller: interests,
                                              decoration: InputDecoration(
                                                  hintText: "Interests",
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20))),
                                              keyboardType: TextInputType.name,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: Text("UPDATE"),
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                backgroundColor:
                                                    Colors.pinkAccent),
                                          ),
                                        )
                                      ]),
                                    );
                                  });
                            });
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          tileColor: Colors.white,
                          leading: Icon(
                            Icons.woman_outlined,
                            color: Colors.pinkAccent,
                          ),
                          title: Text(
                            'Gender: ',
                            style: GoogleFonts.aBeeZee(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          trailing: Icon(
                            Icons.edit,
                            color: Colors.pinkAccent,
                          ),
                          onTap: () {
                            setState(() {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                    ),
                                  ),
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: Wrap(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              controller: gender,
                                              decoration: InputDecoration(
                                                  hintText: "Gender",
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20))),
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: Text("UPDATE"),
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                backgroundColor:
                                                    Colors.pinkAccent),
                                          ),
                                        )
                                      ]),
                                    );
                                  });
                            });
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          tileColor: Colors.white,
                          leading: Icon(
                            Icons.phone,
                            color: Colors.pinkAccent,
                          ),
                          title: Text(
                            'Mobile: ',
                            style: GoogleFonts.aBeeZee(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          trailing: Icon(
                            Icons.edit,
                            color: Colors.pinkAccent,
                          ),
                          onTap: () {
                            setState(() {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                    ),
                                  ),
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: Wrap(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              controller: mobileNo,
                                              decoration: InputDecoration(
                                                  hintText: "Mobile Number",
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20))),
                                              keyboardType: TextInputType.name,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: Text("UPDATE"),
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                backgroundColor:
                                                    Colors.pinkAccent),
                                          ),
                                        )
                                      ]),
                                    );
                                  });
                            });
                          }),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Submit"),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor: Colors.pinkAccent),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget BottomSheet(BuildContext context) {
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
                    context: context,
                    builder: ((builder) => BottomSheet(context)));
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
}
