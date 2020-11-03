import 'package:covid19/pages/hospitalSearch.dart';
import 'package:covid19/widgets.dart';
import 'package:flutter/material.dart';

import 'package:covid19/services/covid.dart';

class HospitalPage extends StatefulWidget {
  @override
  _HospitalPageState createState() => _HospitalPageState();
}

class _HospitalPageState extends State<HospitalPage> {
  List hospitalData;

  fetchStatisticData() async {
    List hospitalData = await CovidInfo.fetchHospital();

    setState(() {
      this.hospitalData = hospitalData;
    });
  }

  Future fetchData() async {
    setState(() {
      this.hospitalData = null;
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
        title: Text('Hospital List'),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: HospitalSearch(hospitalData));
              })
        ],
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: hospitalData == null
            ? Center(
                child: Column(
                children: [
                  SizedBox(height: 50.0),
                  CircularProgressIndicator(),
                  SizedBox(height: 10.0),
                  Text(
                    'fetching hospital data...',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ))
            : ListView.builder(
                itemCount: hospitalData.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0
                    ),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey[500], width: 1.0) )
                    ),
                    child: Column(
                      children: [
                        Row(children: [
                          Flexible(
                            child: Text(hospitalData[index]['name'], style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),)
                          )
                        ]),
                        Row(children: [
                          Text(
                            'Address: ',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Flexible(child: Text(
                            hospitalData[index]['address'].length==0 ? '-' : hospitalData[index]['address']
                          ))
                        ]),
                        Row(children: [
                          Text(
                            'Phone No.: ',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Flexible(child: Text(
                            hospitalData[index]['phone'].length==0 ? '-' : hospitalData[index]['phone']
                          ))
                        ]),
                        HospitalCapacity(hospitalCapacity:hospitalData[index]['capacity']),
                        Row(children: [
                          Text(
                            'Contact Person: ',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Flexible(child: Text(
                            hospitalData[index]['contact_person'].length==0 ? '-' : hospitalData[index]['contact_person']
                          ))
                        ]),
                        Row(children: [
                          Text(
                            'Contact Person No.: ',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Flexible(child: Text(
                            hospitalData[index]['contact_person_number'].length==0 ? '-' : hospitalData[index]['contact_person_number']
                          ))
                        ]),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
