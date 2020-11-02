import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class NEWSPage extends StatelessWidget {
  final Map news;

  NEWSPage({this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID NEWS'),
      ),
      body: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  launch(news['data'][index]['url']);
                },
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    child: Text(
                      news['data'][index]['title'],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
                    child: Text(news['data'][index]['summary'],
                        style: TextStyle(color: Colors.grey[700], fontSize: 14),
                        textAlign: TextAlign.justify),
                  )
                ]),
              ),
            );
          }),
    );
  }
}
