import 'package:covid19/datasource.dart';
import 'package:covid19/pages/hospitals.dart';
import 'package:covid19/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:url_launcher/url_launcher.dart';

class Nepal extends StatefulWidget {
  final Map nepalStatistics;
  final Map provinceData;

  Nepal({this.nepalStatistics, this.provinceData});

  @override
  _NepalState createState() => _NepalState();
}

class _NepalState extends State<Nepal> {
  bool _visibility = true;

  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nepal Statistics'),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Text(
                'Overall Statistics',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              )),
          Container(
              margin: EdgeInsets.only(bottom: 15.0),
              child: NepalPanel(nepalStatistics: widget.nepalStatistics)),
          Divider(height: 1.0),
          Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 10.0),
              child: Text(
                'Province-wise Statistics',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              )),
          ProvinceWidget(provinceData: widget.provinceData),
          Divider(height: 1.0),
          Visibility(
            visible: _visibility,
            child: Container(
              color: primaryBlack,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        '1115(बिहान ६ देखि राती १० सम्म) 1133(चौबीसै घण्टा)',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        '9851-255-834, 9851-255-837 , 9851-255-839',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '(बिहान ८ - बेलुका ८)',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: Builder(
        builder: (context) => FabCircularMenu(
          key: fabKey,
          alignment: Alignment.bottomRight,
          ringColor: primaryBlack,
          ringDiameter: 275.0,
          ringWidth: 50.0,
          fabSize: 50.0,
          fabElevation: 8.0,
          fabIconBorder: CircleBorder(),
          fabColor: primaryBlack,
          fabOpenIcon: Icon(Icons.menu, color: Colors.white),
          fabCloseIcon: Icon(Icons.close, color: Colors.white),
          fabMargin: const EdgeInsets.all(5.0),
          animationDuration: const Duration(milliseconds: 800),
          animationCurve: Curves.easeInOutCirc,
          onDisplayChange: (isOpen) {
            setState(() {
              _visibility = !isOpen;
            });
          },
          children: <Widget>[
            RawMaterialButton(
              onPressed: () {
                // Navigator.push(context,
                // MaterialPageRoute(builder: (context) => ImportantNumber()));
              },
              shape: CircleBorder(),
              padding: const EdgeInsets.all(5.0),
              child: Icon(Icons.call, color: Colors.white),
            ),
            RawMaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HospitalPage()));
              },
              shape: CircleBorder(),
              padding: const EdgeInsets.all(5.0),
              child: Icon(Icons.local_hospital_rounded, color: Colors.white),
            ),
            RawMaterialButton(
              onPressed: () {
                launch('https://nepalcovid.netlify.app/');
              },
              shape: CircleBorder(),
              padding: const EdgeInsets.all(5.0),
              child: Icon(Icons.tv_rounded, color: Colors.white),
            ),
            RawMaterialButton(
              onPressed: () {
                launch('https://www.who.int/nepal');
              },
              shape: CircleBorder(),
              padding: const EdgeInsets.all(5.0),
              child: Icon(Icons.info_outline, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
