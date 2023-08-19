import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
  TextEditingController address = new TextEditingController();
  TextEditingController bio = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 50,),
                Text("Hey! It's Me"),
                Center(child: CircleAvatar(
                
                  radius: 55,
                )),
                ListTile(
                
                    leading: Icon(
                      Icons.man_2_rounded,
                      color: Colors.pinkAccent,
                    ),
                    title: Text('Name: '),
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
                                padding: MediaQuery.of(context).viewInsets,
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
                                                    BorderRadius.circular(20))),
                                        keyboardType: TextInputType.name,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text("UPDATE"),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.pinkAccent),
                                    ),
                                  )
                                ]),
                              );
                            });
                      });
                    }),
                    ListTile(
                    leading: Icon(
                      Icons.man_2_rounded,
                      color: Colors.pinkAccent,
                    ),
                    title: Text('Name: '),
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
                                padding: MediaQuery.of(context).viewInsets,
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
                                                    BorderRadius.circular(20))),
                                        keyboardType: TextInputType.name,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text("UPDATE"),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.pinkAccent),
                                    ),
                                  )
                                ]),
                              );
                            });
                      });
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
