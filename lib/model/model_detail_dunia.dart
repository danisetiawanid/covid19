import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DetailWorldModel extends StatefulWidget {
  _DetailWorldModelState createState() => _DetailWorldModelState();
}

class _DetailWorldModelState extends State<DetailWorldModel> {
  final String apidetaildunia = 'https://api.kawalcorona.com/';

  Future<List<DetaiWorldModel>> _fetchUsers() async {
    final uri = Uri.tryParse(apidetaildunia);
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();
      List<DetaiWorldModel> listOfUsers = items.map<DetaiWorldModel>((json) {
        return DetaiWorldModel.fromJson(json);
      }).toList();

      return listOfUsers;
    } else {
      throw Exception('Failed to load internet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Per Negara'),
      ),
      body: FutureBuilder<List<DetaiWorldModel>>(
        future: _fetchUsers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListView(
            children: snapshot.data
                .map((data) => Container(
                      height: MediaQuery.of(context).size.height / 3.6,
                      padding: EdgeInsets.all(16),
                      child: Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.only(left: 18, top: 4),
                                child: Text(
                                  data.negara.toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )),
                            Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Container(
                                            child: CircleAvatar(
                                                child: Image.asset(
                                                    'images/virus_orange.png'),
                                                backgroundColor:
                                                    Colors.orange[50]),
                                            width: 36.0,
                                            height: 36.0,
                                            padding: const EdgeInsets.all(
                                                2.0), // borde width
                                            decoration: BoxDecoration(
                                              color: const Color(
                                                  0xFFFFFFFF), // border color
                                              shape: BoxShape.circle,
                                            )),
                                        Text(
                                          data.positif.toString(),
                                          style: TextStyle(
                                              color: Colors.orange,
                                              fontFamily: 'Kanit',
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('Kasus Positif',
                                            style: TextStyle(fontSize: 13)),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Container(
                                            child: CircleAvatar(
                                                child: Image.asset(
                                                    'images/sehat.png'),
                                                backgroundColor:
                                                    Colors.green[50]),
                                            width: 36.0,
                                            height: 36.0,
                                            padding: const EdgeInsets.all(
                                                2.0), // borde width
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            )),
                                        Text(
                                          data.sehat.toString(),
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontFamily: 'Kanit',
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('Sehat',
                                            style: TextStyle(fontSize: 13)),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Container(
                                            child: CircleAvatar(
                                                child: Image.asset(
                                                    'images/meninggal.png'),
                                                backgroundColor:
                                                    Colors.red[50]),
                                            width: 36.0,
                                            height: 36.0,
                                            padding: const EdgeInsets.all(
                                                2.0), // borde width
                                            decoration: BoxDecoration(
                                              color: const Color(
                                                  0xFFFFFFFF), // border color
                                              shape: BoxShape.circle,
                                            )),
                                        Text(
                                          data.meninggal.toString(),
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontFamily: 'Kanit',
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('Meninggal',
                                            style: TextStyle(fontSize: 13)),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}

class DetaiWorldModel {
  final String negara;
  final int positif;
  final int sehat;
  final int meninggal;

  DetaiWorldModel({this.negara, this.positif, this.sehat, this.meninggal});

  factory DetaiWorldModel.fromJson(Map<String, dynamic> json) {
    return DetaiWorldModel(
        negara: json['attributes']['Country_Region'],
        positif: json['attributes']['Confirmed'],
        sehat: json['attributes']['Recovered'],
        meninggal: json['attributes']['Deaths']);
  }
}
