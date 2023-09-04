import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  int _value4 = 25;
  int _value5 = 10;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  String selectedValue = "English";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 67, 127),
        title: Center(
          child: Text(
            "FILTER",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                child: Column(children: [
              Text(
                "I'm open to date ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(children: <Widget>[
                SizedBox(
                  width: 10,
                ), //SizedBox
                Text(
                  'Women: ',
                  style: TextStyle(fontSize: 17.0),
                ), //Text
                SizedBox(width: 220), //SizedBox

                Checkbox(
                  value: this.value1,
                  onChanged: (bool? value) {
                    setState(() {
                      this.value1 = value!;
                    });
                  },
                  activeColor: Colors
                      .pink, // Set the fill color when checked (background color)
                  checkColor: Colors.grey,
                ),
              ]), //Checkbox
              //<Widget>[]
              Divider(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ), //SizedBox
                  Text(
                    'Men: ',
                    style: TextStyle(fontSize: 17.0),
                  ), //Text
                  SizedBox(width: 240), //SizedBox
                  /** Checkbox Widget **/

                  Checkbox(
                    value: this.value2,
                    onChanged: (bool? value) {
                      setState(() {
                        this.value2 = value!;
                      });
                    },
                    activeColor: Colors
                        .pink, // Set the fill color when checked (background color)
                    checkColor: Colors.grey,
                  ), //Checkbox
                ], //<Widget>[
              ), //Row
              Divider(
                height: 2,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ), //SizedBox
                  Text(
                    'NonBinary People: ',
                    style: TextStyle(fontSize: 17.0),
                  ), //Text
                  SizedBox(width: 150), //SizedBox
                  /** Checkbox Widget **/
                  Checkbox(
                    value: this.value3,
                    onChanged: (bool? value) {
                      setState(() {
                        this.value3 = value!;
                      });
                    },
                    activeColor: Colors
                        .pink, // Set the fill color when checked (background color)
                    checkColor: Colors.grey,
                  ), //Checkbox
                ], //<Widge
              ), //Column
            ])),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Card(
                child: Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Languages",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(
                width: 130,
              ),
              DropdownButton<String>(
                items: <String>[
                  'English',
                  'Hindi',
                  'Bengali',
                  'Urdu',
                  'Marathi',
                  'Gujrathi',
                  'Other'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
              ),
            ])),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Select your Age from 18 to ${_value4}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  SfSlider(
                    min: 18,
                    max: 100,
                    value: _value4,
                    interval: 10,
                    activeColor:
                        Colors.pink, // Set the active track color to blue
                    inactiveColor: Colors.grey,
                    // showTicks: true,
                    //showLabels: true,
                    enableTooltip: true,
                    onChanged: (dynamic value) {
                      setState(() {
                        _value4 = value.toInt();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Select your Distance from 1 to ${_value5}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  SfSlider(
                    min: 18,
                    max: 100,
                    value: _value5,
                    interval: 10,
                    activeColor:
                        Colors.pink, // Set the active track color to blue
                    inactiveColor: Colors.grey,
                    // showTicks: true,
                    //showLabels: true,
                    enableTooltip: true,
                    onChanged: (dynamic value) {
                      setState(() {
                        _value5 = value.toInt();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
         
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 224, 67, 120)),
              onPressed: () {},
              child: Text(
                "DONE",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
