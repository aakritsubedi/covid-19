import 'package:covid19/pages/faqs.dart';
import 'package:covid19/pages/news.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

  const StatusTable({Key key, this.nepalStatistics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          child: Table(children: [
            TableRow(children: [
              TableCell(
                  child: Center(
                      child: Column(
                children: [
                  Text(
                    nepalStatistics['tested_positive'].toString(),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text('Positive',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey)),
                ],
              ))),
              TableCell(
                  child: Center(
                      child: Column(
                children: [
                  Text(
                    nepalStatistics['tested_negative'].toString(),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text('Negative',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey)),
                ],
              ))),
              TableCell(
                  child: Center(
                      child: Column(
                children: [
                  Text(
                    nepalStatistics['tested_total'].toString(),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text('Total',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey)),
                ],
              ))),
            ]),
          ]),
        ),
        SizedBox(height: 30.0),
        Table(children: [
          TableRow(children: [
            TableCell(
                child: Center(
                    child: Column(
              children: [
                Text(
                  nepalStatistics['in_isolation'].toString(),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text('Isolation',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
              ],
            ))),
            TableCell(
                child: Center(
                    child: Column(
              children: [
                Text(
                  nepalStatistics['recovered'].toString(),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text('Recovered',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
              ],
            ))),
            TableCell(
                child: Center(
                    child: Column(
              children: [
                Text(
                  nepalStatistics['deaths'].toString(),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text('Deaths',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
              ],
            ))),
          ]),
        ]),
        SizedBox(height: 30.0),
        Table(children: [
          TableRow(children: [
            TableCell(
                child: Center(
                    child: Column(
              children: [
                Text(
                  nepalStatistics['quarantined'].toString(),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text('Qurantined',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
              ],
            ))),
            TableCell(
                child: Center(
                    child: Column(
              children: [
                Text(
                  nepalStatistics['tested_rdt'].toString(),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text('Total RDT',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
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

class MostEffectCountry extends StatelessWidget {
  final List countryData;

  MostEffectCountry({this.countryData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.network(
                      countryData[index]['countryInfo']['flag'],
                      height: 40.0,
                      width: 40.0,
                    ),
                    SizedBox(width: 25.0),
                    Text(
                      countryData[index]['country'].toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(children: [
                  Text(
                    'Total Cases: ' +
                        countryData[index]['totalCases'].toString(),
                    style: TextStyle(color: Colors.blue),
                  ),
                  Text(
                    'Recovered: ' +
                        countryData[index]['totalRecovered'].toString(),
                    style: TextStyle(color: Colors.green),
                  ),
                  Text(
                    'Deaths: ' + countryData[index]['totalDeaths'].toString(),
                    style: TextStyle(color: Colors.red),
                  )
                ])
              ],
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}

class InfoPanel extends StatelessWidget {
  final Map news;

  InfoPanel({this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FAQPage()));
        },
        child: Container(
            color: primaryBlack,
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'FAQ',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Icon(Icons.arrow_forward, color: Colors.white)
              ],
            )),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NEWSPage(news: news)));
        },
        child: Container(
            color: primaryBlack,
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'News',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Icon(Icons.arrow_forward, color: Colors.white)
              ],
            )),
      ),
      GestureDetector(
        onTap: () {
          launch('https://covid19.mohp.gov.np/');
        },
        child: Container(
            color: primaryBlack,
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'MOPH Nepal',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Icon(Icons.arrow_forward, color: Colors.white)
              ],
            )),
      ),
      GestureDetector(
        onTap: () {
          launch(
              'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
        },
        child: Container(
            color: primaryBlack,
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Myth Brusters',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Icon(Icons.arrow_forward, color: Colors.white)
              ],
            )),
      )
    ]));
  }
}

class ProvinceWidget extends StatelessWidget {
  final Map provinceData;

  ProvinceWidget({this.provinceData});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Container(
            child: GridView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 1),
                children: [
              ProvinceCard(
                  provinceNo: '1',
                  active: provinceData['cases'][0]['count'].toString(),
                  recovered: provinceData['recovered'][0]['count'].toString(),
                  deaths: provinceData['deaths'][0]['count'].toString()),
              ProvinceCard(
                  provinceNo: '2',
                  active: provinceData['cases'][1]['count'].toString(),
                  recovered: provinceData['recovered'][1]['count'].toString(),
                  deaths: provinceData['deaths'][1]['count'].toString()),
              ProvinceCard(
                  provinceNo: '3',
                  active: provinceData['cases'][2]['count'].toString(),
                  recovered: provinceData['recovered'][2]['count'].toString(),
                  deaths: provinceData['deaths'][2]['count'].toString()),
              ProvinceCard(
                  provinceNo: '4',
                  active: provinceData['cases'][3]['count'].toString(),
                  recovered: provinceData['recovered'][3]['count'].toString(),
                  deaths: provinceData['deaths'][3]['count'].toString()),
              ProvinceCard(
                  provinceNo: '5',
                  active: provinceData['cases'][4]['count'].toString(),
                  recovered: provinceData['recovered'][4]['count'].toString(),
                  deaths: provinceData['deaths'][4]['count'].toString()),
              ProvinceCard(
                  provinceNo: '6',
                  active: provinceData['cases'][5]['count'].toString(),
                  recovered: provinceData['recovered'][5]['count'].toString(),
                  deaths: provinceData['deaths'][5]['count'].toString()),
              ProvinceCard(
                  provinceNo: '7',
                  active: provinceData['cases'][6]['count'].toString(),
                  recovered: provinceData['recovered'][6]['count'].toString(),
                  deaths: provinceData['deaths'][6]['count'].toString()),
            ])));
  }
}

class ProvinceCard extends StatelessWidget {
  final String provinceNo;
  final String active;
  final String recovered;
  final String deaths;

  ProvinceCard({this.provinceNo, this.active, this.recovered, this.deaths});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(5.0),
      height: 80.0,
      width: width / 2,
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(5.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Column(children: [
                Text(
                  'Deaths: $deaths',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.grey[800]),
                ),
                Text(
                  'Cases: $active',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.grey[800]),
                ),
                Text(
                  'Recovered: $recovered',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.grey[800]),
                ),
              ])),
          Divider(height: 1.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Province $provinceNo',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey[700],
                  letterSpacing: 1.2),
            ),
          ),
        ],
      ),
    );
  }
}

class HospitalCapacity extends StatelessWidget {
  final hospitalCapacity;

  HospitalCapacity({this.hospitalCapacity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          child: Table(children: [
            TableRow(children: [
              TableCell(
                  child: Center(
                      child: Column(
                children: [
                  Text(
                    hospitalCapacity['beds'].length==0 ? '-' : hospitalCapacity['beds'].toString().split(" ")[0],
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text('Beds',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey)),
                ],
              ))),
              TableCell(
                  child: Center(
                      child: Column(
                children: [
                  Text(
                    hospitalCapacity['ventilators'].length==0 ? '-' : hospitalCapacity['ventilators'].toString(),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text('Vantilator',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey)),
                ],
              ))),
              TableCell(
                  child: Center(
                      child: Column(
                children: [
                  Text(
                    hospitalCapacity['isolation_beds'].length==0 ? '-' : hospitalCapacity['isolation_beds'].toString(),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text('Isolation Beds',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey)),
                ],
              ))),
            ]),
          ]),
        ),
        SizedBox(height: 10.0),
        Table(children: [
          TableRow(children: [
            TableCell(
                child: Center(
                    child: Column(
              children: [
                Text(
                  hospitalCapacity['occupied_beds'].length==0 ? '-' : hospitalCapacity['occupied_beds'].toString(),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text('Occupied Beds',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
              ],
            ))),
            TableCell(
                child: Center(
                    child: Column(
              children: [
                Text(
                  hospitalCapacity['doctors'].length==0 || hospitalCapacity['doctors'].length > 1  ? '-' : hospitalCapacity['doctors'].toString(),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text('Doctors',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
              ],
            ))),
            TableCell(
                child: Center(
                    child: Column(
              children: [
                Text(
                  hospitalCapacity['nurses'].length==0 ? '-' : hospitalCapacity['nurses'].toString(),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text('Nurses',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
              ],
            ))),
          ]),
        ]),
        SizedBox(height: 15.0),
      ],
    );
  }
}
