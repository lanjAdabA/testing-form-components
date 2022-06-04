import 'dart:developer';
// import 'package:intl/intl.dart';

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
  DateTimeRange dateRange =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  // String dateRange = "";
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;

  DateTime? start = DateTime.now();
  DateTime? end = DateTime.now();

  GenderCharacter? _character = GenderCharacter.male;

  String dropdownValue = '*SELECT COUNTRY *';

  @override
  Widget build(BuildContext context) {
    // DateTime? end = dateRange.end;

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
            // TEXT_FIELD:
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

            const SizedBox(
              height: 60,
            ),
            // NUMBER_FIELD:
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
            const SizedBox(
              height: 60,
            ),
            //DROPDOWN:
            DropdownButton(
              isExpanded: true,
              value: dropdownValue,
              icon: const Icon(Icons.arrow_drop_down_outlined),
              elevation: 16,
              style: TextStyle(color: Colors.purple[200]),
              underline: Container(
                height: 1,
                color: Colors.purple[300],
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
            const SizedBox(
              height: 60,
            ),
            //RADIO:

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
                  horizontalTitleGap: 10,
                  contentPadding: const EdgeInsets.only(right: 0),
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
                  horizontalTitleGap: 10,
                  contentPadding: const EdgeInsets.only(right: 0),
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
                  horizontalTitleGap: 10,
                  contentPadding: const EdgeInsets.only(right: 0),
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
            const SizedBox(
              height: 60,
            ),
            //CHECKBOX:

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "* Choose the Required Options *",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.blueGrey),
                ),
                const SizedBox(
                  height: 10,
                ),
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
            const SizedBox(
              height: 60,
            ),
            //DATE_PICKER:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1990),
                        lastDate: DateTime(2023),
                      ).then((value) {
                        setState(() {
                          _dateTime = value!;
                        });
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.grey[800],
                      child: const Text(
                        "*  Select Date_of_Birth *",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      "   »  ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.lightGreenAccent),
                    ),
                    Text(
                      "${_dateTime.day}/ ",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.yellow),
                    ),
                    Text(
                      "${_dateTime.month}/ ",
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
            ),

            const SizedBox(
              height: 60,
            ),
            //DATE_RANGE_PICKER:

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () async {
                      final d = await showDateRangePicker(
                        context: context,
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2025),
                      );
                      setState(() {
                        // dateRange = d.toString();
                        log((start?.day).toString());
                        start = d?.start;

                        log((end?.day).toString());
                        end = d?.end;
                      });
                      // var x = d?.start.toIso8601String();
                      // var x = DateFormat("yyyy-MM-dd").format(start);

                      // log(x.toString());
                      // log(d);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.grey[800],
                      child: const Text(
                        "*  Select Range_of_date Preffered *",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      "   »  ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.lightGreenAccent),
                    ),
                    Text(
                      ("${start?.day}/${start?.month}/${start?.year}      to    ") /*  . substring(0, 10) + dateRange.substring(27,37) */,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.yellow),
                    ),
                    Text(
                      ("${end?.day}/${end?.month}/${end?.year} ") /*  . substring(0, 10) + dateRange.substring(27,37) */,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.yellow),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ))),
      ),
    );
  }
}




/* 

`¡™£¢∞§¶•ªº–≠
œ∑´®†¥¨ˆøπ“‘«»
åß∂ƒ©˙∆˚¬…æ
≈ç√∫˜µ≤≥÷
⁄€‹›ﬁﬂ‡°·‚—±
 Í˝ÓÔÒÚÆ
 ¸˛Ç◊˜Â¯˘¿

 */