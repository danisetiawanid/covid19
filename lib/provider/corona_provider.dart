import 'package:covid19app/model/detail_indonesia_model.dart';
import 'package:covid19app/model/world_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:covid19app/model/indonesia_model.dart';

class CoronaProvider with ChangeNotifier {
  IndonesiaModel summary;
  WorldModel world;
  DetailIndonesiaModel detailIndo;

  Future<void> getData() async {
    final apicovid = 'https://kawalcovid19.harippe.id/api/summary';
    final response = await http.get(apicovid);
    final result = json.decode(response.body) as Map<String, dynamic>;

     
    final worldPositive = 'https://api.kawalcorona.com/positif/';
    final responsePositive = await http.get(worldPositive);
    final resultPositive = json.decode(responsePositive.body);

    final worldRecovered = 'https://api.kawalcorona.com/sembuh/';
    final responseRecovered = await http.get(worldRecovered);
    final resultRecovered = json.decode(responseRecovered.body);

    final worldDeaths = 'https://api.kawalcorona.com/meninggal/';
    final responseDeaths = await http.get(worldDeaths);
    final resultDeaths = json.decode(responseDeaths.body);
    

    world = WorldModel(
      confirmed: resultPositive['value'],
      deaths: resultRecovered['value'],
      recovered: resultDeaths['value'],
    );

    summary = IndonesiaModel(
      confirmed: result['confirmed']['value'],
      recovered: result['recovered']['value'],
      deaths: result['deaths']['value'],
    
    );

   
    notifyListeners();
  }

 
}
