import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config.dart';

final bool isEdit = false;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController name = new TextEditingController();
  TextEditingController age = new TextEditingController();
  TextEditingController gender = new TextEditingController();
  TextEditingController mobileNo = new TextEditingController();
  TextEditingController interests = new TextEditingController();
  TextEditingController bio = new TextEditingController();

  void createProfileUser() async {
    var profilebody = {
      "name": name,
      "age": age,
      "bio": bio,
      "interests": interests,
      "gender": gender,
      "mobile": mobileNo
    };
    var response = await http.post(Uri.parse(profilecreation),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(profilebody));
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
              //shape:Border.all(color: Colors.pinkAccent),
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

                      // style: GoogleFonts.aboreto(
                      //     fontSize: 50, fontWeight: FontWeight.bold),
                      style: GoogleFonts.aBeeZee(
                          fontSize: 50, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          buildImage(),
                          Positioned(
                            bottom: 0,
                            right: 4,
                            child: buildEditIcon(Colors.grey),
                          ),
                        ],
                      ),
                    ),
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildImage() {
  return ClipOval(
    child: Material(
      color: Colors.transparent,
      child: Ink.image(
        image: AssetImage("assets/datingy.jpeg"),
        fit: BoxFit.cover,
        width: 140,
        height: 140,
        child: InkWell(onTap: () {}),
      ),
    ),
  );
}

Widget buildEditIcon(Color color) => buildCircle(
      color: Colors.white,
      all: 3,
      child: buildCircle(
        color: color,
        all: 8,
        child: Icon(
          isEdit ? Icons.add_a_photo : Icons.edit,
          color: Colors.white,
          size: 15,
        ),
      ),
    );

Widget buildCircle({
  required Widget child,
  required double all,
  required Color color,
}) =>
    ClipOval(
      child: Container(
        padding: EdgeInsets.all(all),
        color: color,
        child: child,
      ),
    );
