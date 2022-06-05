import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:paribartan/screens/home_screen.dart';

import '../models/patient.dart';
import '../services/api_services.dart';

class RegisterScrren extends StatefulWidget {
  const RegisterScrren({Key? key}) : super(key: key);

  @override
  State<RegisterScrren> createState() => _RegisterScrrenState();
}

class _RegisterScrrenState extends State<RegisterScrren> {
  // String birthDate = "";
  DateTime birthDate = DateTime(1990, 05, 14);
  TextEditingController cBirthDate = TextEditingController();
  TextEditingController cName = TextEditingController();
  TextEditingController cAddress = TextEditingController();
  TextEditingController cPhone = TextEditingController();
  TextEditingController cEmail = TextEditingController();
  TextEditingController cPassword = TextEditingController();

  List<String> dropDownOptionGender = ['Male', 'Female', 'Other'];
  List<String> dropDownOptionPlace = ['Urban', 'Rural'];
  List<String> dropDownOptionMaritialStatus = ['Married', 'Unmarried'];
  List<String> dropDownOptionOccupation = [
    'Agriculture',
    'Government Job',
    'NGO/INGO',
    'Private Job',
    'Small Business',
    'Daily wages Labor',
    'Student',
    'Others',
  ];
  List<String> dropDownOptionEduction = [
    'Illiterate',
    'Primary',
    'Secondary',
    'Bachelor',
    'Master',
    'Above',
  ];
  List<String> dropDownOptionBloodGroup = [
    'A RhD positive (A+)',
    'A RhD negative (A-)',
    'B RhD positive (B+)',
    'B RhD negative (B-)',
    'O RhD positive (O+)',
    'O RhD negative (O-)',
    'AB RhD positive (AB+)',
    'AB RhD negative (AB-)',
  ];
  String genderValue = "Male";
  String educationValue = "Secondary";
  String placeValue = "Rural";
  String marriedValue = "Unmarried";
  String occupationValue = "Others";
  String bloodGroupValue = "A RhD positive (A+)";

  Future<void> _selectDate(BuildContext context) async {
    DateTime? _datePicker = await showDatePicker(
        context: context,
        initialDate: birthDate,
        firstDate: DateTime(1980),
        lastDate: DateTime(2022));

    if (_datePicker != null && _datePicker != birthDate) {
      setState(() {
        birthDate = _datePicker;
        cBirthDate.text = DateFormat('yyyy-MM-dd').format(birthDate);
      });
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    String month = birthDate.month.toString().padLeft(2, '0');
    cBirthDate.text = DateFormat('yyyy-MM-dd').format(birthDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'New Registration',
                        style: GoogleFonts.lato(fontSize: 22),
                      ),
                    ),
                    TextFormField(
                      controller: cName,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        if (value.length < 3) {
                          return 'Name must be atleast 3 characters long';
                        }
                        return null;
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            controller: cBirthDate,
                            readOnly: true,
                            decoration: const InputDecoration(
                              labelText: 'Birth Date',
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: IconButton(
                                onPressed: () => _selectDate(context),
                                icon: const Icon(Icons.calendar_today)))
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text('Gender'),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: DropdownButton<String>(
                        value: genderValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.white),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            genderValue = newValue!;
                          });
                        },
                        items: dropDownOptionGender
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text('Education'),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: DropdownButton<String>(
                        value: educationValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.white),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            educationValue = newValue!;
                          });
                        },
                        items: dropDownOptionEduction
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text('Place'),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: DropdownButton<String>(
                        value: placeValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.white),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            placeValue = newValue!;
                          });
                        },
                        items: dropDownOptionPlace
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: cAddress,
                      decoration: const InputDecoration(
                        labelText: 'Address',
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text('Maritial Status'),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: DropdownButton<String>(
                        value: marriedValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.white),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            marriedValue = newValue!;
                          });
                        },
                        items: dropDownOptionMaritialStatus
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text('Occupation'),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: DropdownButton<String>(
                        value: occupationValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.white),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            occupationValue = newValue!;
                          });
                        },
                        items: dropDownOptionOccupation
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    TextFormField(
                      controller: cPhone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter phone number';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text('Blood Group'),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: DropdownButton<String>(
                        value: bloodGroupValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.white),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            bloodGroupValue = newValue!;
                          });
                        },
                        items: dropDownOptionBloodGroup
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    TextFormField(
                      controller: cEmail,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return 'Please enter valid email';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    TextFormField(
                      controller: cPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm password';
                        }
                        if (cPassword.text != value) {
                          return 'Password does not match';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                      ),
                    ),
                    const SizedBox(height: 20),
                    MaterialButton(
                        child: const Text('Register'),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            // print("Name is " + cName.text);
                            // print("Birthday is " + cBirthDate.text);
                            // print("Gender is " + genderValue);
                            // print("Eduction is " + educationValue);
                            // print("Place is " + placeValue);
                            // print("Address is " + cAddress.text);
                            // print("Maritial Status is " + marriedValue);
                            // print("Occupation is " + occupationValue);
                            // print("Phone Number is " + cPhone.text);
                            // print(
                            //   "Alert Start from : " +
                            //       DateFormat('yyyy-MM-dd')
                            //           .format(DateTime.now()),
                            // );
                            // print("alerttime: 21:30:11");
                            // print("Blood Group is " + bloodGroupValue);
                            // print("Email is " + cEmail.text);
                            // print("Password is " + cPassword.text);

                            Attributes a = Attributes(
                              address: cAddress.text,
                              alertstartfrom: DateFormat('yyyy-MM-dd')
                                  .format(DateTime.now()),
                              alerttime: "21:30:11",
                              bloodgroup: bloodGroupValue,
                              education: educationValue,
                              email: cEmail.text,
                              birthdate: cBirthDate.text,
                              createdAt: DateTime.now(),
                              gender: genderValue,
                              maritialstatus: marriedValue,
                              name: cName.text,
                              occupation: occupationValue,
                              phone: cPhone.text,
                              place: placeValue,
                              publishedAt: DateTime.now(),
                              updatedAt: DateTime.now(),
                            );
                            bool result =
                                await APIService.addPatient(a, cPassword.text);
                            if (result) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title:
                                          const Text("Registration Successful"),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomeScreen(a)));
                                            },
                                            child: Text("Click to login.")),
                                      ],
                                    );
                                  });
                            }
                          }
                        })
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
