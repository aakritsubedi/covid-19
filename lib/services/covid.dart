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

  static Future<Map> fetchByProvince () async {
    http.Response response = await http.get(baseUrl+'covid/summary');
    Map provinceData = json.decode(response.body);
    provinceData = provinceData['province'];

    return provinceData;
  } 

  static Future<List> fetchCountryWiseData () async {
    http.Response response = await http.get(nepalBaseUrl+'data/world');
    List countryData = json.decode(response.body);
    countryData.removeRange(0,2);
    return countryData;
  } 

  static Future<Map> fetchNews() async {
    http.Response response = await http.get(nepalBaseUrl+'news');
    Map news = json.decode(response.body);

    return news;
  } 

  static Future<List> fetchHospital() async {
    http.Response response = await http.get(nepalBaseUrl+'hospitals');
    Map hospitals = json.decode(response.body);

    return hospitals['data'];
  } 

}