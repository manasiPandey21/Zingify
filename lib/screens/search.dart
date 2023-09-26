import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:zingify/models/userModel.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart'; // Import the lottie package

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();
  List<UserModel> userList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 227, 231),
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Center(
            child: Text(
              "Search your SoulMate",
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 40,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: _searchController,
              onChanged: (value) => searchUsers(value),
              decoration: InputDecoration(
                hintText: 'Search...',
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Colors.black,
                  ),
                  onPressed: () => _searchController.clear(),
                ),
                prefixIcon: IconButton(
                  icon: Icon(Icons.search, color: Colors.black),
                  onPressed: () {},
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pinkAccent),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: userList.isEmpty
                ? Center(
                    // Display Lottie animation when userList is empty
                    child: Lottie.network(
                      "https://lottie.host/759915ea-b9bb-4178-acc4-9b823c3d95f9/Ktr1ibZIGO.json", // Replace with your animation file path
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  )
                : ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(userList[index].name),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void searchUsers(String query) async {
    final url = Uri.parse('http://192.168.1.5:2500/search/$query');

    try {
      final response = await http.get(url);
      print(response);
      if (response.statusCode == 200) {
        
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          userList = data.map((item) => UserModel.fromJson(item)).toList();
        });
      } else {
        print('API Error: ${response.statusCode}');
        print('API Response: ${response.body}');
        throw Exception('Failed to load users');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
