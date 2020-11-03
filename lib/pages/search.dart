import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  final List countryData;

  Search(this.countryData);

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
        ? countryData
        : countryData
            .where((element) => element['country']
                .toString()
                .toLowerCase()
                .startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return Container(
          height: 130.0,
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[100],
                    blurRadius: 1.0,
                    offset: Offset(0, 2)),
              ],
              borderRadius: BorderRadius.circular(5.0)),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(suggestionList[index]['country'],
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Image.network(
                      suggestionList[index]['countryInfo']['flag'],
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
                          suggestionList[index]['totalCases'].toString(),
                      style: TextStyle(
                          color: Colors.cyan, fontWeight: FontWeight.bold),
                    ),
                    Text(
                        'Active: ' +
                            suggestionList[index]['activeCases'].toString(),
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold)),
                    Text(
                        'Recovered: ' +
                            suggestionList[index]['totalRecovered'].toString(),
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold)),
                    Text(
                        'Deaths: ' +
                            suggestionList[index]['totalDeaths'].toString(),
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold)),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
