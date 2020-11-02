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


  const WorldWidePanel({Key key}) : super(key: key);

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
            panelColor: Colors.yellow[50],
            textColor: Colors.yellow,
            count: '1236'
          ),
          StatusPanel(
            title: 'Active',
            panelColor: Colors.blue[100],
            textColor: Colors.blue,
            count: '1236'
          ),
          StatusPanel(
            title: 'Recovered',
            panelColor: Colors.green[100],
            textColor: Colors.green,
            count: '1236'
          ),
          StatusPanel(
            title: 'Deaths',
            panelColor: Colors.red[100],
            textColor: Colors.red,
            count: '1236'
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {

  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  StatusPanel({ this.panelColor, this.textColor, this.title, this.count });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(10.0),
      height: 80.0,
      width: width / 2,
      decoration: BoxDecoration(
        color: panelColor,
        borderRadius: BorderRadius.circular(5.0)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: textColor),
          ),
          Text(
            count,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
          )
        ],
      ),
    );
  }
}
