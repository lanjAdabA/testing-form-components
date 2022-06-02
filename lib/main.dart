import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

enum GenderCharacter { male, female, others }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _dateTime = DateTime.now();
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;

  GenderCharacter? _character = GenderCharacter.male;

  String dropdownValue = '*SELECT COUNTRY *';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(40),
        child: Center(
            child: Form(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // TEXT_FIELD
            TextFormField(
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.amber),
              decoration: const InputDecoration(
                  hintText: "* text *",
                  hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.amber)),
            ),

            // NUMBER_FIELD
            TextFormField(
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.red),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: "* number *",
                  hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.red)),
            ),

            //DROPDOWN
            DropdownButton(
              isExpanded: true,
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 1,
                color: Colors.deepPurpleAccent,
              ),
              items: <String>[
                '*SELECT COUNTRY *',
                'India ',
                'Pakistan',
                'China',
                'America',
                'Dubai ',
                'Thailand',
                'Canada',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value, /* style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white), */
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
            ),

            //RADIO

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "* Select Gender *",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 23, 211, 186)),
                ),
                ListTile(
                  title: const Text('male'),
                  leading: Radio<GenderCharacter>(
                    value: GenderCharacter.male,
                    groupValue: _character,
                    onChanged: (GenderCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('female'),
                  leading: Radio<GenderCharacter>(
                    value: GenderCharacter.female,
                    groupValue: _character,
                    onChanged: (GenderCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('others'),
                  leading: Radio<GenderCharacter>(
                    value: GenderCharacter.others,
                    groupValue: _character,
                    onChanged: (GenderCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
              ],
            ),

            //CHECKBOX

            Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                        value: isChecked1,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked1 = value!;
                          });
                        },
                        checkColor: Colors.blue,
                        fillColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.disabled)) {
                            return Colors.black.withOpacity(.32);
                          }
                          return Colors.blueGrey;
                        })),
                    const Text(
                      "* select Option 1",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.blueGrey),
                    )
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: isChecked2,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked2 = value!;
                          });
                        },
                        checkColor: Colors.blue,
                        fillColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.disabled)) {
                            return Colors.black.withOpacity(.32);
                          }
                          return Colors.blueGrey;
                        })),
                    const Text(
                      "* select Option 2",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.blueGrey),
                    )
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: isChecked3,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked3 = value!;
                          });
                        },
                        checkColor: Colors.blue,
                        fillColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.disabled)) {
                            return Colors.black.withOpacity(.32);
                          }
                          return Colors.blueGrey;
                        })),
                    const Text(
                      "* select Option 3",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.blueGrey),
                    )
                  ],
                ),
              ],
            ),

            //DATE_PICKER
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2025),
                      ).then((value) {
                        setState(() {
                          _dateTime = value!;
                        });
                      });
                    },
                    child: const Text(
                      "* Date of Birth *",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    )),
                Row(
                  children: [
                    const Text(
                      "∆  ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.lightGreenAccent),
                    ),
                    Text(
                      "${_dateTime.day}/",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.yellow),
                    ),
                    Text(
                      "${_dateTime.month}/",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.pink),
                    ),
                    Text(
                      _dateTime.year.toString(),
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.green),
                    ),
                  ],
                ),
              ],
            )

            /*  DatePickerDialog(
                initialDate: DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2023)) */
          ],
        ))),
      ),
    );
  }
}
