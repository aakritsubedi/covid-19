import 'package:flutter/material.dart';
import 'package:covid19/widgets.dart';

class HospitalSearch extends SearchDelegate {
  final List hospitalData;

  HospitalSearch(this.hospitalData);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? hospitalData
        : hospitalData
            .where((element) => element['name']
                .toString()
                .toLowerCase()
                .startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey[500], width: 1.0))),
          child: Column(
            children: [
              Row(children: [
                Flexible(
                    child: Text(
                  suggestionList[index]['name'],
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                ))
              ]),
              Row(children: [
                Text(
                  'Address: ',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Flexible(
                    child: Text(suggestionList[index]['address'].length == 0
                        ? '-'
                        : suggestionList[index]['address']))
              ]),
              Row(children: [
                Text(
                  'Phone No.: ',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Flexible(
                    child: Text(suggestionList[index]['phone'].length == 0
                        ? '-'
                        : suggestionList[index]['phone']))
              ]),
              HospitalCapacity(
                  hospitalCapacity: suggestionList[index]['capacity']),
              Row(children: [
                Text(
                  'Contact Person: ',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Flexible(
                    child: Text(
                        suggestionList[index]['contact_person'].length == 0
                            ? '-'
                            : suggestionList[index]['contact_person']))
              ]),
              Row(children: [
                Text(
                  'Contact Person No.: ',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Flexible(
                    child: Text(
                        suggestionList[index]['contact_person_number'].length ==
                                0
                            ? '-'
                            : suggestionList[index]['contact_person_number']))
              ]),
            ],
          ),
        );
      },
    );
  }
}
