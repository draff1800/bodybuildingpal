import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  ProfileState createState() {
    return ProfileState();
  }
}

class ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController dobInput = TextEditingController();

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
      body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Attributes',
                  style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Row(children: [
                  const Icon(Icons.transgender, size: 30),
                  const Text('Gender',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Radio(
                      value: "male",
                      groupValue: "gender",
                      onChanged: (value) => {}),
                  const Text('Male', style: TextStyle(fontSize: 15)),
                  Radio(
                      value: "female",
                      groupValue: "gender",
                      onChanged: (value) => {}),
                  const Text('Female', style: TextStyle(fontSize: 15)),
                ]),
                Row(children: [
                  const Icon(Icons.calendar_month, size: 30),
                  const Text('DOB',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Container(
                      constraints: const BoxConstraints.expand(
                        height: 20,
                        width: 200,
                      ),
                      child: TextFormField(
                          controller: dobInput,
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(DateTime.now().year - 120),
                                lastDate: DateTime.now());

                            if (pickedDate != null) {
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              setState(() {
                                dobInput.text = formattedDate;
                              });
                            } else {}
                          }))
                ]),
                Row(children: [
                  const RotatedBox(
                    quarterTurns: 1,
                    child: Icon(Icons.straighten, size: 30),
                  ),
                  const Text('Height',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Container(
                      constraints: const BoxConstraints.expand(
                        height: 20,
                        width: 200,
                      ),
                      child: TextFormField())
                ]),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
                  child: ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50)),
                      child: const Text('SAVE')),
                ),
              ],
            ),
          )
      ),
    );
  }
}
