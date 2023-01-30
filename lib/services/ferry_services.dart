import 'dart:convert';

import 'package:feribot_lines/models/others/country.dart';
import 'package:feribot_lines/models/others/key_value_model.dart';
import 'package:feribot_lines/models/request/ferry/search_trip_request.dart';
import 'package:feribot_lines/models/response/ferry/seaport_response.dart';
import 'package:feribot_lines/models/response/ferry/search_trip_response.dart';
import 'package:feribot_lines/services/api_paths.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class FerryServices {
  static Future<Dio> _getInstance() async {
    final _dio = Dio();
    _dio.options.baseUrl = API.baseApiUrl;
    _dio.options.headers = API.headers;
    return _dio;
  }

  static Future<SearchTripResponse> searchTrip() async {
    SearchTripResponse _searchResults = SearchTripResponse();
    SearchTripRequest _requestBody = SearchTripRequest.fromModel();

    // var url = Uri.parse(API.baseApiUrl + API.searchTrip).toString();
    // final _dio = await _getInstance();
    // var response = await _dio.post(
    //   url,
    //   // headers: API.headers,
    //   data: _requestBody,
    // );

    // _searchResults = SearchTripResponse.fromJson(response.data);
    _searchResults = SearchTripResponse(
      departureModel: [],
      returnModel: [],
    );
    _searchResults.departureModel!.add(Trip(
      expeditionId: 34,
      companyName: "Turyol",
      companyLogo: API.baseUrl +
          "uploads/companies/875d442879ebde4dc51e9058c500f6d8777b2f6974381e9e79fb2dd83214ed14.jpg",
      arrivePortName: "Midilli",
      departurePortName: "Ayvalık",
      bestPriceGuarantee: "0",
      ferryName: "ARAÇLI FERİBOT / FOKAIA",
      adult: "15",
      children: "7",
      baby: "2",
      bike: "5",
      motorcycle: "20",
      automobile: "40",
      minibus: "125",
      bus: "200",
      exchangeCode: "EUR",
      exchangeId: 3,
      totalAmount: 34,
    ));
    _searchResults.returnModel!.add(Trip(
      expeditionId: 170,
      companyName: "Turyol",
      companyLogo: API.baseApiUrl +
          "uploads/companies/875d442879ebde4dc51e9058c500f6d8777b2f6974381e9e79fb2dd83214ed14.jpg",
      arrivePortName: "Midilli",
      departurePortName: "Ayvalık",
      bestPriceGuarantee: "0",
      ferryName: "ARAÇLI FERİBOT / FOKAIA",
      adult: "15",
      children: "7",
      baby: "2",
      bike: "5",
      motorcycle: "20",
      automobile: "40",
      minibus: "125",
      bus: "200",
      exchangeCode: "EUR",
      exchangeId: 3,
      totalAmount: 34,
    ));
    // if (response.statusCode == 200) {
    // } else {
    //   Get.snackbar("Hata", "Lütfen internet bağlantınızı kontrol ediniz.");
    // }

    return _searchResults;
  }

  static Future<List<SeaPort>> getdeparturePorts() async {
    List<SeaPort> _ports = [];
    await Future.delayed(const Duration(seconds: 2), () {
      _ports = [
        SeaPort(id: 0, name: "Fethiye"),
        SeaPort(id: 1, name: "Atina"),
        SeaPort(id: 2, name: "Ayvalık"),
        SeaPort(id: 3, name: "Bodrum"),
        SeaPort(id: 4, name: "Çeşme"),
        SeaPort(id: 5, name: "Didim"),
      ];
    });

    // var url = Uri.parse(API.baseApiUrl + API.departurePorts);
    // var response = await http.get(url, headers: API.headers);

    // if (response.statusCode == 200) {
    //   _ports = (jsonDecode(response.body) as List)
    //       .map((e) => SeaPort.fromJson(e))
    //       .toList();
    //   _ports.remove(_ports.firstWhere(
    //     (element) => element.id == 1638784839,
    //   ));
    // } else {
    //   !Get.isSnackbarOpen
    //       ? Get.snackbar("Hata", "Lütfen internet bağlantınızı kontrol ediniz.")
    //       : null;
    // }
    return _ports;
  }

  static Future<List<SeaPort>> getArrivePorts(int departurePortID) async {
    List<SeaPort> _ports = [];
    await Future.delayed(const Duration(seconds: 2), () {
      if (departurePortID == 0) {
        _ports = [
          SeaPort(id: 0, name: "Rodos"),
        ];
      } else {
        _ports = [
          SeaPort(id: 0, name: "Paros"),
          SeaPort(id: 1, name: "Patmos"),
          SeaPort(id: 2, name: "Rodos"),
          SeaPort(id: 3, name: "Sakarya"),
          SeaPort(id: 4, name: "Sarız"),
          SeaPort(id: 5, name: "Samoz"),
        ];
      }
    });
    // var url = Uri.parse(
    //     API.baseApiUrl + API.arrivePorts + departurePortID.toString());
    // var response = await http.get(url, headers: API.headers);

    // if (response.statusCode == 200) {
    //   _ports = (jsonDecode(response.body) as List)
    //       .map((e) => SeaPort.fromJson(e))
    //       .toList();
    // } else {
    //   !Get.isSnackbarOpen
    //       ? Get.snackbar("Hata", "Lütfen internet bağlantınızı kontrol ediniz.")
    //       : null;
    // }
    return _ports;
  }

  static Future<List<Country>> getCountries() async {
    List<Country> _countries = [];

    await Future.delayed(const Duration(seconds: 2), () {
      _countries = [
        Country(id: 0, countryCode: "+1", countryName: "A Ülkesi"),
        Country(id: 1, countryCode: "+2", countryName: "B Ülkesi"),
        Country(id: 2, countryCode: "+3", countryName: "C Ülkesi"),
        Country(id: 3, countryCode: "+4", countryName: "D Ülkesi"),
        Country(id: 4, countryCode: "+5", countryName: "E Ülkesi"),
        Country(id: 5, countryCode: "+6", countryName: "F Ülkesi"),
      ];
    });

    // var url = Uri.parse(API.baseApiUrl + API.nationalities).toString();
    // final _dio = await _getInstance();
    // var response = await _dio.post(url);

    // if (response.statusCode == 200) {
    //   _countries = response.data.map((e) => Country.fromJson(e)).toList();
    // } else {
    //   !Get.isSnackbarOpen
    //       ? Get.snackbar("Hata", "Lütfen internet bağlantınızı kontrol ediniz.")
    //       : null;
    // }
    return _countries;
  }
}
