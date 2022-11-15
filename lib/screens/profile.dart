import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../constants/app_colours.dart';

enum Gender { male, female }

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Gender? _genderInput;
  final TextEditingController _dobInput = TextEditingController();
  final TextEditingController _heightInput = TextEditingController();

  @override
  void dispose() {
    _genderInput = null;
    _dobInput.dispose();
    _heightInput.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          color: AppColours.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
                child: Text(
                'Attributes',
                  style: TextStyle(
                      color: AppColours.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Icon(Icons.transgender, size: 40)
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Text('Gender',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                    )
                  ),
                  Radio(
                      value: Gender.male,
                      groupValue: _genderInput,
                      onChanged: (Gender? value) {
                        setState(() {
                          _genderInput = value;
                        });
                      }
                  ),
                  const Text('Male', style: TextStyle(fontSize: 15)),
                  Radio(
                      value: Gender.female,
                      groupValue: _genderInput,
                      onChanged: (Gender? value) {
                        setState(() {
                          _genderInput = value;
                        });
                      }
                  ),
                  const Text('Female', style: TextStyle(fontSize: 15)),
                ]),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Icon(Icons.calendar_month, size: 40)
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 60, 0),
                      child: Text('DOB',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                      )
                    ),
                    Container(
                        constraints: const BoxConstraints.expand(
                          height: 20,
                          width: 170,
                        ),
                        child: TextField(
                            controller: _dobInput,
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(DateTime.now().year - 120),
                                  lastDate: DateTime.now());

                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat('dd-MM-yyy').format(pickedDate);
                                setState(() {
                                  _dobInput.text = formattedDate;
                                });
                              }
                            }
                        )
                    )
                  ])
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Icon(Icons.straighten, size: 40),
                    )
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 39, 0),
                    child: Text('Height',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                    )
                  ),
                  Container(
                      constraints: const BoxConstraints.expand(
                        height: 20,
                        width: 60,
                      ),
                      child: TextField(controller: _heightInput)
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Text('cm', style: TextStyle(fontSize: 15))
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 40),
                child: ElevatedButton(
                    onPressed: null,
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50)
                    ),
                    child: const Text('SAVE')),
              ),
            ],
          )
        )
      ),
    );
  }
}
