import 'package:flutter/material.dart';

import 'package:covid19/widgets.dart';
import 'package:covid19/services/covid.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map worldwideData;
  Map nepalStatistics;

  fetchStatisticData() async {
    Map worldWideStatistics = await CovidInfo.fetchWorldWideData();
    Map nepalStatistics = await CovidInfo.fetchNepalData();
    setState(() {
      this.worldwideData = worldWideStatistics;
      this.nepalStatistics = nepalStatistics;
    });

  }

  @override
  void initState() {
    fetchStatisticData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Quotes(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Row(
                children: [
                  Icon(Icons.public),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Worldwide',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            worldwideData == null
                ? Center(child: Column(
                  children: [
                    SizedBox(height: 10.0),
                    CircularProgressIndicator(),
                    SizedBox(height: 10.0),
                    Text('fetching worldwide data...', style: TextStyle(fontSize: 12),)
                  ],
                ))
                : WorldWidePanel(worldwideData: worldwideData),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: Row(
                children: [
                  Icon(Icons.pin_drop),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Nepal',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            nepalStatistics == null
                ? Center(child: Column(
                  children: [
                    SizedBox(height: 10.0),
                    CircularProgressIndicator(),
                    SizedBox(height: 10.0),
                    Text('fetching Nepal data...', style: TextStyle(fontSize: 12),)
                  ],
                ))
                : NepalPanel(nepalStatistics: nepalStatistics),
          ],
        ),
      ),
    );
  }
}
