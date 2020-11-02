import 'dart:convert';

import 'package:http/http.dart' as http;

class CovidInfo {

  static String baseUrl = 'https://data.nepalcorona.info/api/v1/';
  static String nepalBaseUrl = 'https://nepalcorona.info/api/v1/';

  static Future<Map> fetchWorldWideData () async {
    http.Response response = await http.get(baseUrl+'world');
    Map worldwideData = json.decode(response.body);

    return worldwideData;
  } 

  static Future<Map> fetchNepalData () async {
    http.Response response = await http.get(nepalBaseUrl+'data/nepal');
    Map nepalData = json.decode(response.body);

    return nepalData;
  } 

  static Future<List> fetchCountryWiseData () async {
    http.Response response = await http.get(nepalBaseUrl+'data/world');
    List countryData = json.decode(response.body);
    countryData.removeRange(0,2);
    return countryData;
  } 

}