import 'package:flutter/material.dart';

class Informasi extends StatefulWidget {
  @override
  _InformasiState createState() => _InformasiState();
}

class _InformasiState extends State<Informasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            expandedHeight: MediaQuery.of(context).size.height / 3,
            flexibleSpace: Stack(
              children: <Widget>[
                Positioned.fill(
                    child: Image.asset(
                  'images/corona.jpg',
                  fit: BoxFit.cover,
                )),
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
                padding: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height / 1.6,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.2, 0.8],
                        colors: [Colors.white, Colors.blue[50]])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Apa Itu Virus Corona',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 7,
                      child: Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.all(10)),
                            Icon(
                              Icons.home,
                              size: 40,
                              color: Colors.blue,
                            ),
                            Padding(padding: EdgeInsets.all(10)),
                            Text('Mengenal', style: TextStyle(fontSize: 18),)
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ]))
        ],
      ),
    );
  }
}
