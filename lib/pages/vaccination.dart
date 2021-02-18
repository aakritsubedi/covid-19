import 'package:flutter/material.dart';

import '../widgets.dart';

class VaccinationPage extends StatefulWidget {
  @override
  _VaccinationPageState createState() => _VaccinationPageState();
}

class _VaccinationPageState extends State<VaccinationPage> {
  bool isHTML = true;
  String body;
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _contactNoController = TextEditingController();
  final _addressController = TextEditingController();

  myTextFormField(controller, hintText, isPassword, isEmail) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        obscureText: isPassword ? true : false,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }

  Future<void> send() async {
    body = 'Hello ${_fullNameController.text}, <br/>';
    body +=
        '<p> We received your request. Our team is working to submit your application to nearest COVID vaccination points(nearby ${_addressController.text}). We will let you know the progess soon. If you have any queries feel free to reply this email. </p>';
    body +=
        '<p>Also go through the following links that provides information about the COVID vaccine, procedure and other related information.</p>';

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('COVID Vaccine'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Quotes(),
              SizedBox(height: 15.0),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'COVID Vaccination Request Form',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        myTextFormField(
                            _fullNameController, 'Full Name', false, false),
                        myTextFormField(_emailController, 'Email', false, true),
                        myTextFormField(
                            _addressController, 'Address', false, false),
                        myTextFormField(
                            _contactNoController, 'Contact No.', false, false),
                        RaisedButton(
                          onPressed: () => send(),
                          child: Text('Submit'),
                        ),
                        SizedBox(height: 5.0),
                        Divider(height: 1.0),
                        SizedBox(height: 5.0),
                        Text(
                            'Nepal started vaccinating health and security workers against Covid-19 on Wednesday, using some of the 1 million doses of the AstraZeneca vaccines donated by India on 20 January.'),
                        Text(
                            'The Health Ministry has prepared a list of 430,000 health personnel who will get their first dose this week. Also included will be senior citizens, police and army as well as female community health volunteers all over the country.'),
                        SizedBox(height: 10.0),
                        Center(
                            child: Text(
                          'WE ARE TOGETHER IN THE FIGHT',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.4,
                              color: Colors.grey[800]),
                        )),
                        SizedBox(height: 20.0),
                      ]))
            ],
          ),
        ));
  }
}
