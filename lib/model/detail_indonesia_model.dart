import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DetailIndonesiaModel extends StatefulWidget {
  _DetailIndonesiaModelState createState() => _DetailIndonesiaModelState();
}

class _DetailIndonesiaModelState extends State<DetailIndonesiaModel> {
  final String uri = 'https://api.kawalcorona.com/indonesia/provinsi/';

  Future<List<Users>> _fetchUsers() async {
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();
      List<Users> listOfUsers = items.map<Users>((json) {
        return Users.fromJson(json);
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
        title: Text('Fetching data from JSON - ListView'),
      ),
      body: FutureBuilder<List<Users>>(
        future: _fetchUsers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          return ListView(
            children: snapshot.data
                .map((user) => ListTile(
                      title: Text(user.provinsilur),
                      subtitle: Text(user.positiflur.toString()),
                      leading: CircleAvatar(
                        backgroundColor: Colors.red,
                        // child: Text(user.positiflur,
                        //     style: TextStyle(
                        //       fontSize: 18.0,
                        //       color: Colors.green,
                        //     )),
                      ),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}

class Users {
  int id;
  String provinsilur;
  int positiflur;
  String email;

  Users({
    this.id,
    this.provinsilur,
    this.positiflur,
    this.email,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      provinsilur: json['attributes']['Provinsi'],
       positiflur: json['attributes']['Kasus_Posi'],
     
    );
  }
}