import 'package:covid19/datasource.dart';
import 'package:covid19/pages/country.dart';
import 'package:covid19/pages/nepal.dart';
import 'package:covid19/pages/podcast.dart';
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
  List countryData;
  Map news;
  Map provinceData;

  fetchStatisticData() async {
    Map worldWideStatistics = await CovidInfo.fetchWorldWideData();
    Map nepalStatistics = await CovidInfo.fetchNepalData();
    List countryData = await CovidInfo.fetchCountryWiseData();
    Map news = await CovidInfo.fetchNews();
    Map provinceData = await CovidInfo.fetchByProvince();

    setState(() {
      this.worldwideData = worldWideStatistics;
      this.nepalStatistics = nepalStatistics;
      this.countryData = countryData;
      this.news = news;
      this.provinceData = provinceData;
    });
  }

  Future fetchData() async {
    setState(() {
      this.worldwideData = null;
      this.nepalStatistics = null;
      this.countryData = null;
      this.news = null;
      this.provinceData = null;
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
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Quotes(),
              VaccineInfo(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.public),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Worldwide',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CountryPage()));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        decoration: BoxDecoration(
                            color: primaryBlack,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Text(
                          'Regional',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              worldwideData == null
                  ? Center(
                      child: Column(
                      children: [
                        SizedBox(height: 10.0),
                        CircularProgressIndicator(),
                        SizedBox(height: 10.0),
                        Text(
                          'fetching worldwide data...',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ))
                  : WorldWidePanel(worldwideData: worldwideData),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.network(
                          'https://disease.sh/assets/img/flags/np.png',
                          height: 30.0,
                          width: 30.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Nepal',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Nepal(
                                    nepalStatistics: nepalStatistics,
                                    provinceData: provinceData)));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 8.0),
                        decoration: BoxDecoration(
                            color: primaryBlack,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Text(
                          'View More',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              nepalStatistics == null
                  ? Center(
                      child: Column(
                      children: [
                        SizedBox(height: 10.0),
                        CircularProgressIndicator(),
                        SizedBox(height: 10.0),
                        Text(
                          'fetching Nepal data...',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ))
                  : NepalPanel(nepalStatistics: nepalStatistics),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: Text(
                  'Most affected Countries',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              countryData == null
                  ? Center(
                      child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(height: 10.0),
                          LinearProgressIndicator(),
                          SizedBox(height: 10.0),
                          Text(
                            'fetching countrywise data...',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ))
                  : MostEffectCountry(countryData: countryData),
              SizedBox(height: 20.0),
              Podcast(),
              SizedBox(height: 20.0),
              InfoPanel(news: news),
              SizedBox(height: 20.0),
              Center(
                  child: Text(
                'WE ARE TOGETHER IN THE FIGHT',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.4,
                    color: Colors.grey[800]),
              )),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
