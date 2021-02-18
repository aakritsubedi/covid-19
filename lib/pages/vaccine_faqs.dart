import 'package:covid19/datasource.dart';
import 'package:flutter/material.dart';

class VaccineFAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccine FAQs'),
      ),
      body: ListView.builder(
        itemCount: DataSource.vaccineFAQ.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(
              DataSource.vaccineFAQ[index]['question'],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 10.0
                ),
                child: Text(
                  DataSource.vaccineFAQ[index]['answer'],
                  style: TextStyle(color: Colors.grey[700], fontSize: 14),
                  textAlign: TextAlign.justify
                ),
              )
            ],
          );
        }),
    );
  }
}
