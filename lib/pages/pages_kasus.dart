import 'package:covid19app/model/model_detail_dunia.dart';
import 'package:covid19app/model/model_detail_indonesia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:covid19app/provider/provider_corona.dart';

class KasusPage extends StatelessWidget {
  final List<String> dropdownValues = ["Indonesia"];
  
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
String formattedDate = DateFormat('d MMMM').format(now);
    
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
    value: const SystemUiOverlayStyle(statusBarColor: Color(0xFF2E7D32)),
    sized: false,
    child: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height + 90,
            child: Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Image.asset(
                      'images/header1.png',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.3,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        top: MediaQuery.of(context).size.height / 12,
                        child: Container(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 14),
                            child: Text(
                              'Lawan\nCOVID-19',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                  fontFamily: 'Kanit',
                                  fontWeight: FontWeight.bold),
                            )))
                  ],
                ),
                Container(
                  child: Positioned(
                      top: MediaQuery.of(context).size.height / 3,
                      child: Container(
                        padding: EdgeInsets.all(30),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.1, 0.8],
                              colors: [Colors.white, Colors.blueGrey[50]]),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0)),
                        ),
                        child: Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              padding: EdgeInsets.symmetric(horizontal: 32.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    style: BorderStyle.solid, width: 0.9),
                              ),
                              child: Container(
                                child: DropdownButton(
                                  items: dropdownValues
                                      .map((value) => DropdownMenuItem(
                                            child: Text(value),
                                            value: value,
                                          ))
                                      .toList(),
                                  onChanged: (String value) {},
                                  isExpanded: true,
                                  value: dropdownValues.first,
                                  icon: Image.asset('images/arrow_down.png'),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Text(
                                'Update Kasus Corona',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Terakhir di update $formattedDate',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.4)),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 38,
                                    child: FlatButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailIndonesiaModel()));
                                        },
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              'Lihat Detail ',
                                              style: TextStyle(
                                                  color: Colors.green
                                                      .withOpacity(0.8)),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.green,
                                              size: 12,
                                            )
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 4.8,
                              child: Card(
                                elevation: 6,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24)),
                                child: RefreshIndicator(
                                  onRefresh: () => Provider.of<CoronaProvider>(
                                          context,
                                          listen: false)
                                      .getData(),
                                  child: FutureBuilder(
                                    future: Provider.of<CoronaProvider>(context,
                                            listen: false)
                                        .getData(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      return Consumer<CoronaProvider>(
                                          builder: (context, data, _) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Column(
                                              children: <Widget>[
                                                Padding(
                                                    padding: EdgeInsets.all(8)),
                                                Container(
                                                    child: CircleAvatar(
                                                        child: Image.asset(
                                                            'images/virus_orange.png'),
                                                        backgroundColor:
                                                            Colors.orange[50]),
                                                    width: 36.0,
                                                    height: 36.0,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0), // borde width
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFFFFFFFF), // border color
                                                      shape: BoxShape.circle,
                                                    )),
                                                Text(
                                                  data.summary.confirmed
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.orange,
                                                      fontFamily: 'Kanit',
                                                      fontSize: 34,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text('Kasus Positif',
                                                    style: TextStyle(
                                                        fontSize: 13)),
                                              ],
                                            ),
                                            Column(
                                              children: <Widget>[
                                                Padding(
                                                    padding: EdgeInsets.all(8)),
                                                Container(
                                                    child: CircleAvatar(
                                                        child: Image.asset(
                                                            'images/sehat.png'),
                                                        backgroundColor:
                                                            Colors.green[50]),
                                                    width: 36.0,
                                                    height: 36.0,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0), // borde width
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    )),
                                                Text(
                                                  data.summary.recovered
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.green,
                                                      fontFamily: 'Kanit',
                                                      fontSize: 34,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text('Sehat',
                                                    style: TextStyle(
                                                        fontSize: 13)),
                                              ],
                                            ),
                                            Column(
                                              children: <Widget>[
                                                Padding(
                                                    padding: EdgeInsets.all(8)),
                                                Container(
                                                    child: CircleAvatar(
                                                        child: Image.asset(
                                                            'images/meninggal.png'),
                                                        backgroundColor:
                                                            Colors.red[50]),
                                                    width: 36.0,
                                                    height: 36.0,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0), // borde width
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFFFFFFFF), // border color
                                                      shape: BoxShape.circle,
                                                    )),
                                                Text(
                                                  data.summary.deaths
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontFamily: 'Kanit',
                                                      fontSize: 34,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text('Meninggal',
                                                    style: TextStyle(
                                                        fontSize: 13)),
                                              ],
                                            )
                                          ],
                                        );
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 14),
                              child: Text(
                                'Kasus Corona Dunia',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Terakhir di update $formattedDate',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.4)),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 38,
                                    child: FlatButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailWorldModel()));
                                        },
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              'Lihat Detail ',
                                              style: TextStyle(
                                                  color: Colors.green
                                                      .withOpacity(0.8)),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.green,
                                              size: 12,
                                            )
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 4.6,
                              child: Card(
                                elevation: 6,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24)),
                                child: Container(
                                  padding: EdgeInsets.only(top: 20),
                                  child: RefreshIndicator(
                                    onRefresh: () =>
                                        Provider.of<CoronaProvider>(context,
                                                listen: false)
                                            .getData(),
                                    child: FutureBuilder(
                                      future: Provider.of<CoronaProvider>(
                                              context,
                                              listen: false)
                                          .getData(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                        return Consumer<CoronaProvider>(
                                            builder: (context, data, _) {
                                          return Row(
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
                                                              Colors
                                                                  .orange[50]),
                                                      width: 36.0,
                                                      height: 36.0,
                                                      padding: const EdgeInsets
                                                              .all(
                                                          2.0), // borde width
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xFFFFFFFF), // border color
                                                        shape: BoxShape.circle,
                                                      )),
                                                  Column(
                                                    children: <Widget>[
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 6)),
                                                      Text(
                                                        data.world.confirmed
                                                            .toString(),
                                                        style: TextStyle(
                                                            color:
                                                                Colors.orange,
                                                            fontFamily: 'Kanit',
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: <Widget>[
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 4)),
                                                      Text('Kasus Positif',
                                                          style: TextStyle(
                                                              fontSize: 13)),
                                                    ],
                                                  ),
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
                                                      padding: const EdgeInsets
                                                              .all(
                                                          2.0), // borde width
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      )),
                                                  Column(
                                                    children: <Widget>[
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 6)),
                                                      Text(
                                                        data.world.recovered
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors.green,
                                                            fontFamily: 'Kanit',
                                                            fontSize: 26,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: <Widget>[
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 4)),
                                                      Text('Sehat',
                                                          style: TextStyle(
                                                              fontSize: 13)),
                                                    ],
                                                  ),
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
                                                      padding: const EdgeInsets
                                                              .all(
                                                          2.0), // borde width
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xFFFFFFFF), // border color
                                                        shape: BoxShape.circle,
                                                      )),
                                                  Column(
                                                    children: <Widget>[
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 6)),
                                                      Text(
                                                        data.world.deaths
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors.red,
                                                            fontFamily: 'Kanit',
                                                            fontSize: 26,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: <Widget>[
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 4)),
                                                      Text('Meninggal',
                                                          style: TextStyle(
                                                              fontSize: 13)),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          );
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
  )
      
      
    );
  }
}

