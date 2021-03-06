import 'package:covid19app/model/model_detail_indonesia.dart';
import 'package:covid19app/model/model_dunia.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:covid19app/model/model_indonesia.dart';

class CoronaProvider with ChangeNotifier {
  IndonesiaModel summary;
  WorldModel world;
  DetailIndonesiaModel detailIndo;

  Future<void> getData() async {
    final apicovid = 'https://api.kawalcorona.com/indonesia/';
    final uri = Uri.tryParse(apicovid);
    final response = await http.get(uri);
    final result = json.decode(response.body);

    final worldPositive = 'https://api.kawalcorona.com/positif/';
    final uriWorldPositive = Uri.tryParse(worldPositive);
    final responsePositive = await http.get(uriWorldPositive);
    final resultPositive = json.decode(responsePositive.body);

    final worldRecovered = 'https://api.kawalcorona.com/sembuh/';
    final uriWorldRecovered = Uri.tryParse(worldRecovered);
    final responseRecovered = await http.get(uriWorldRecovered);
    final resultRecovered = json.decode(responseRecovered.body);

    final worldDeaths = 'https://api.kawalcorona.com/meninggal/';
    final uriWorldDeaths = Uri.tryParse(worldDeaths);
    final responseDeaths = await http.get(uriWorldDeaths);
    final resultDeaths = json.decode(responseDeaths.body);

    world = WorldModel(
      confirmed: resultPositive['value'],
      deaths: resultRecovered['value'],
      recovered: resultDeaths['value'],
    );

    summary = IndonesiaModel(
      confirmed: result[0]['positif'],
      recovered: result[0]['sembuh'],
      deaths: result[0]['meninggal'],
    );
    notifyListeners();
  }
}
