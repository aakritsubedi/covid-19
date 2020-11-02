import 'package:covid19/widgets.dart';
import 'package:flutter/material.dart';

class Nepal extends StatelessWidget {
  final Map nepalStatistics;
  final Map provinceData;

  Nepal({this.nepalStatistics, this.provinceData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Nepal Statistics'),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: Text(
                  'Overall Statistics',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                )),
            Container(
                margin: EdgeInsets.only(bottom: 15.0),
                child: NepalPanel(nepalStatistics: nepalStatistics)),
            Divider(height: 1.0),
            Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 10.0),
                child: Text(
                  'Provice-wise Statistics',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                )),
            ProvinceWidget(provinceData: provinceData),
          ]),
        ));
  }
}
