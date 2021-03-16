import 'package:flutter/material.dart';

import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

class Bantuan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 60,
              child: Stack(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Image.asset(
                        'images/header3.png',
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
                                'Pusat\nBantuan',
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
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Text(
                                      'Pusat Bantuan',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          fontFamily: 'Kanit'),
                                    ),
                                    Container(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 10, 10, 10),
                                        child: Text.rich(
                                          TextSpan(
                                            text:
                                                'Jika anda mengalami gejala - gejala  ',
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: 'seperti ini',
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  )),
                                              // can add more TextSpans here...
                                            ],
                                          ),
                                        )),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                      child: Text(
                                        'silahkan hubungi kontak di bawah ini',
                                        style: TextStyle(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 8,
                                child: Card(
                                  elevation: 6,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24)),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(padding: EdgeInsets.all(10)),
                                      Container(
                                          child: CircleAvatar(
                                              child: Image.asset(
                                                  'images/hotline.png'),
                                              backgroundColor:
                                                  Colors.green[50]),
                                          width: 50,
                                          height: 50,
                                          padding: const EdgeInsets.all(
                                              2.0), // borde width
                                          decoration: BoxDecoration(
                                            color: const Color(
                                                0xFFFFFFFF), // border color
                                            shape: BoxShape.circle,
                                          )),
                                      Container(
                                          margin: EdgeInsets.only(left: 12),
                                          child: Text(
                                            'Hotline',
                                            style: TextStyle(fontSize: 18),
                                          )),
                                      Spacer(),
                                      Center(
                                        // ignore: deprecated_member_use
                                        child: FlatButton(
                                            onPressed: () {
                                              FlutterOpenWhatsapp
                                                  .sendSingleMessage(
                                                      "6281133399000",
                                                      "Corona");
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 90,
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.green,
                                              ),
                                              child: Center(
                                                  child: Text(
                                                'Panggil ',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  FlutterOpenWhatsapp.sendSingleMessage(
                                      "6281133399000", "Corona");
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 8,
                                  child: Card(
                                    elevation: 6,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(24)),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(padding: EdgeInsets.all(10)),
                                        Container(
                                            child: CircleAvatar(
                                                child: Image.asset(
                                                    'images/chat.png'),
                                                backgroundColor:
                                                    Colors.blue[50]),
                                            width: 50,
                                            height: 50,
                                            padding: const EdgeInsets.all(
                                                2.0), // borde width
                                            decoration: BoxDecoration(
                                              color: const Color(
                                                  0xFFFFFFFF), // border color
                                              shape: BoxShape.circle,
                                            )),
                                        Container(
                                            margin: EdgeInsets.only(left: 12),
                                            child: Text(
                                              'Konsultasi Dokter',
                                              style: TextStyle(fontSize: 18),
                                            )),
                                        Spacer(),
                                        Container(
                                            margin: EdgeInsets.only(right: 10),
                                            child: Icon(
                                                Icons.keyboard_arrow_right))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  FlutterOpenWhatsapp.sendSingleMessage(
                                      "6281133399000", "Corona");
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 8,
                                  child: Card(
                                    elevation: 6,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(24)),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(padding: EdgeInsets.all(10)),
                                        Container(
                                            child: CircleAvatar(
                                                child: Image.asset(
                                                    'images/hospital.png'),
                                                backgroundColor:
                                                    Colors.red[50]),
                                            width: 50,
                                            height: 50,
                                            padding: const EdgeInsets.all(
                                                2.0), // borde width
                                            decoration: BoxDecoration(
                                              color: const Color(
                                                  0xFFFFFFFF), // border color
                                              shape: BoxShape.circle,
                                            )),
                                        Container(
                                            margin: EdgeInsets.only(left: 12),
                                            child: Text(
                                              'Rumah Sakit Rujukan',
                                              style: TextStyle(fontSize: 18),
                                            )),
                                        Spacer(),
                                        Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child:
                                              Icon(Icons.keyboard_arrow_right),
                                        ),
                                      ],
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
            ),
          ],
        ),
      ),
    );
  }
}
