import 'package:flutter/material.dart';

import 'package:covid19/datasource.dart';

class Quotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      padding: EdgeInsets.all(10.0),
      color: quoteContainer,
      child: Text(
        DataSource.quotes,
        style: TextStyle(
            color: Colors.orange[800],
            fontWeight: FontWeight.w500,
            fontSize: 16.0),
      ),
    );
  }
}

class WorldWidePanel extends StatelessWidget {
  final Map worldwideData;

  WorldWidePanel({this.worldwideData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          StatusPanel(
              title: 'Confirmed',
              panelColor: Colors.cyan[100],
              textColor: Colors.cyan,
              count: worldwideData['cases'].toString()),
          StatusPanel(
              title: 'Active',
              panelColor: Colors.blue[100],
              textColor: Colors.blue,
              count: worldwideData['active'].toString()),
          StatusPanel(
              title: 'Recovered',
              panelColor: Colors.green[100],
              textColor: Colors.green,
              count: worldwideData['recovered'].toString()),
          StatusPanel(
              title: 'Deaths',
              panelColor: Colors.red[100],
              textColor: Colors.red,
              count: worldwideData['deaths'].toString()),
        ],
      ),
    );
  }
}

class NepalPanel extends StatelessWidget {
  final Map nepalStatistics;

  NepalPanel({this.nepalStatistics});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: StatusTable(nepalStatistics: nepalStatistics),
    );
  }
}

class StatusTable extends StatelessWidget {
  final Map nepalStatistics;

  const StatusTable({
    Key key, this.nepalStatistics
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 5.0
          ),
          child: Table(children: [
            TableRow(children: [
              TableCell(child: Center(child: Column(
                children: [
                  Text('Positive'),
                  Text(nepalStatistics['tested_positive'].toString(), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
                ],
              ))),
              TableCell(child: Center(child: Column(
                children: [
                  Text('Negative'),
                  Text(nepalStatistics['tested_negative'].toString(), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
                ],
              ))),
              TableCell(child: Center(child: Column(
                children: [
                  Text('Total'),
                  Text(nepalStatistics['tested_total'].toString(), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
                ],
              ))),
            ]),
          ]),
        ),
        SizedBox(height: 30.0),
        Table(children: [
          TableRow(children: [
            TableCell(child: Center(child: Column(
              children: [
                Text('In Isolation'),
                Text(nepalStatistics['in_isolation'].toString(), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
              ],
            ))),
            TableCell(child: Center(child: Column(
              children: [
                Text('Recovered'),
                Text(nepalStatistics['recovered'].toString(), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
              ],
            ))),
            TableCell(child: Center(child: Column(
              children: [
                Text('Deaths'),
                Text(nepalStatistics['deaths'].toString(), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
              ],
            ))),
          ]),
        ]),
      ],
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  StatusPanel({this.panelColor, this.textColor, this.title, this.count});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(5.0),
      height: 80.0,
      width: width / 2,
      decoration: BoxDecoration(
          color: panelColor, borderRadius: BorderRadius.circular(5.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: textColor,
                letterSpacing: 1.2),
          ),
          Text(
            count == null ? '-' : count,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 14, color: textColor),
          )
        ],
      ),
    );
  }
}
