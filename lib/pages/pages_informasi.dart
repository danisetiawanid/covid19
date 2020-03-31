import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Informasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: Color(0xFF2E7D32)),
      sized: false,
      child: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 30,
            child: Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Image.asset(
                      'images/header2.png',
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
                              'Kenali\nCOVID-19',
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
                              child: Text(
                                'Apa Itu Virus Corona',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'Kanit'),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showSimpleCustomDialog(context);
                              },
                              child: Container(
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
                                                  'images/kenali.png'),
                                              backgroundColor: Colors.red[50]),
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
                                            'Mengenal',
                                            style: TextStyle(fontSize: 18),
                                          )),
                                      Spacer(),
                                      Container(
                                          margin: EdgeInsets.only(right: 20),
                                          child:
                                              Icon(Icons.keyboard_arrow_right))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              child: Container(
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
                                            child:
                                                Image.asset('images/cegah.png'),
                                            backgroundColor: Colors.orange[50]),
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
                                          'Mencegah',
                                          style: TextStyle(fontSize: 18),
                                        )),
                                    Spacer(),
                                    Container(
                                        margin: EdgeInsets.only(right: 20),
                                        child: Icon(Icons.keyboard_arrow_right))
                                  ],
                                ),
                              ),
                            ),onTap: () {
                                showSimpleCustomDialog2(context);
                              },),
                            
                            InkWell(
                              child: Container(
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
                                            child:
                                                Image.asset('images/obat.png'),
                                            backgroundColor: Colors.green[50]),
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
                                          'Mengobati',
                                          style: TextStyle(fontSize: 18),
                                        )),
                                    Spacer(),
                                    Container(
                                        margin: EdgeInsets.only(right: 20),
                                        child: Icon(Icons.keyboard_arrow_right))
                                  ],
                                ),
                              ),
                            ),onTap: () {
                                showSimpleCustomDialog3(context);
                              },),
                            
                            InkWell(
                              child: Container(
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
                                                'images/antisipasi.png'),
                                            backgroundColor: Colors.blue[50]),
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
                                          'Mengantisipasi',
                                          style: TextStyle(fontSize: 18),
                                        )),
                                    Spacer(),
                                    Container(
                                        margin: EdgeInsets.only(right: 20),
                                        child: Icon(Icons.keyboard_arrow_right))
                                  ],
                                ),
                              ),
                            ),onTap: () {
                                showSimpleCustomDialog4(context);
                              },),
                            
                          ],
                        )),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
void showSimpleCustomDialog(BuildContext context) {
        Dialog simpleDialog = Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Container(
            height: 185,
            width: 300.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Virus Corona atau severe acute respiratory syndrome coronavirus 2 (SARS-CoV-2) adalah virus yang menyerang sistem pernapasan. Penyakit karena infeksi virus ini disebut COVID-19. Virus Corona bisa menyebabkan gangguan pada sistem pernapasan, pneumonia akut, sampai kematian.\nsumber : https://www.alodokter.com/virus-corona',
                    style: TextStyle(),
                  ),
                
                ),
               
              ],
            ),
          ),
        );
        showDialog(
            context: context, builder: (BuildContext context) => simpleDialog);
    }
    void showSimpleCustomDialog2(BuildContext context) {
        Dialog simpleDialog = Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Container(
            height: 250,
            width: 300.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    '1. Hindari bepergian ke tempat-tempat umum yang ramai pengunjung (social distancing).\n2. Gunakan masker saat beraktivitas di tempat umum atau keramaian.\n3. Rutin mencuci tangan dengan air dan sabun atau hand sanitizer setelah beraktivitas di luar rumah.\n4. Meningkatkan daya tahan tubuh dengan pola hidup sehat.\n5. Jangan menyentuh mata, mulut, dan hidung sebelum mencuci tangan.\nsumber : https://www.alodokter.com/virus-corona',
                    style: TextStyle(),
                  ),
                
                ),
               
              ],
            ),
          ),
        );
        showDialog(
            context: context, builder: (BuildContext context) => simpleDialog);
    }
    
    void showSimpleCustomDialog4(BuildContext context) {
        Dialog simpleDialog = Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Container(
            height: 250,
            width: 300.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    '1. Merujuk penderita COVID-19 untuk menjalani perawatan dan karatina di rumah sakit yang ditunjuk\n2. Memberikan obat pereda demam dan nyeri yang aman dan sesuai kondisi penderita\n3. Menganjurkan penderita COVID-19 untuk melakukan isolasi mandiri dan istirahat yang cukup\n4. Menganjurkan penderita COVID-19 untuk banyak minum air putih untuk menjaga kadar cairan tubuh\nsumber : https://www.alodokter.com/virus-corona',
                    style: TextStyle(),
                  ),
                
                ),
               
              ],
            ),
          ),
        );
        showDialog(
            context: context, builder: (BuildContext context) => simpleDialog);
    }
    void showSimpleCustomDialog3(BuildContext context) {
        Dialog simpleDialog = Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Container(
            height: 155,
            width: 300.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Sampai saat ini, belum ada vaksin untuk mencegah infeksi virus Corona atau COVID-19. Oleh sebab itu, cara pencegahan yang terbaik adalah dengan menghindari faktor-faktor yang bisa menyebabkan Anda terinfeksi virus ini\nsumber : https://www.alodokter.com/virus-corona',
                    style: TextStyle(),
                  ),
                
                ),
               
              ],
            ),
          ),
        );
        showDialog(
            context: context, builder: (BuildContext context) => simpleDialog);
    }