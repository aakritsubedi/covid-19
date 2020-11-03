import 'package:flutter/material.dart';

import 'package:covid19/services/covid.dart';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData;

  fetchStatisticData() async {
    List countryData = await CovidInfo.fetchCountryWiseData();

    setState(() {
      this.countryData = countryData;
    });
  }

  Future fetchData() async {
    setState(() {
      this.countryData = null;
    });
    fetchStatisticData();
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
        title: Text('Country Statistics'),
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: countryData == null
            ? Center(
                child: Column(
                children: [
                  SizedBox(height: 50.0),
                  CircularProgressIndicator(),
                  SizedBox(height: 10.0),
                  Text(
                    'fetching country data...',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ))
            : ListView.builder(
                itemCount: countryData == null ? 0 : countryData.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 130.0,
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.grey[100],
                          blurRadius: 10,
                          offset: Offset(0, 10))
                    ]),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(countryData[index]['country'],
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              Image.network(
                                countryData[index]['countryInfo']['flag'],
                                height: 50.0,
                                width: 60.0,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Confirmed: ' +
                                    countryData[index]['totalCases'].toString(),
                                style: TextStyle(
                                    color: Colors.cyan,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  'Active: ' +
                                      countryData[index]['activeCases']
                                          .toString(),
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  'Recovered: ' +
                                      countryData[index]['totalRecovered']
                                          .toString(),
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  'Deaths: ' +
                                      countryData[index]['totalDeaths']
                                          .toString(),
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
