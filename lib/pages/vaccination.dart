import 'package:flutter/material.dart';

class VaccinationPage extends StatefulWidget {
  @override
  _VaccinationPageState createState() => _VaccinationPageState();
}

class _VaccinationPageState extends State<VaccinationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID Vaccine'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is vaccination page.'),
            Text('We will add a form to request vaccination.'),
            SizedBox(height: 10.0),
            Text('Your request will be sent as an email to concern authority'),
            Text('and receipt to you in your email address.')
          ],
        ),
      ),
    );
  }
}
