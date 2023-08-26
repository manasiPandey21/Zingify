import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kActiveColor = Colors.black; // Define your active color here

class HobbySelectionWidget extends StatefulWidget {
  @override
  _HobbySelectionWidgetState createState() => _HobbySelectionWidgetState();
}

class _HobbySelectionWidgetState extends State<HobbySelectionWidget> {
  List<String> hobbyList = [
    'Shopping',
    'Comedy',
    'Brunch',
    'Music',
    'Road Trips',
    'Tea',
    'Trivia',
    'Comedy',
    'Clubbing',
    'Drinking',
    'Wine',
    'Hiking',
    'Yoga',
    'Volleyball',
    'Craft Beer',
    'Dogs',
    'Cats',
    'Activism',
    'Vlogging',
    'Museum',
    'Dancing',
    'Running',
    'Singing',
    'Make-Up',
    'Concert',
    'Cafe',
    'Theater',
    'Baking',
    'Gardening',
    'Cooking',
    'Video Games',
    'Camping'
  ];

  List<String> selectedHobbies = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        //title: Center(child: Text('Select Hobbies',),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Center(
          child: Column(
            children: [
              Center(
                child: Text(
                  'Select Hobbies',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Wrap(
                children: hobbyList.map(
                  (hobby) {
                    bool isSelected = selectedHobbies.contains(hobby);

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedHobbies.add(hobby);
                            selectedHobbies.remove(hobby);
                          } else if (selectedHobbies.length < 15) {
                            selectedHobbies.add(hobby);
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: isSelected ? kActiveColor : Colors.pink,
                                width: 2,
                              ),
                            ),
                            child: Text(
                              hobby,
                              style: TextStyle(
                                color: isSelected ? kActiveColor : Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
