import 'package:covid19app/pages/detail_indonesia.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid19app/provider/corona_provider.dart';

class KasusPage extends StatelessWidget {
  final String total;

  KasusPage({
    this.total,
  });
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
                height: MediaQuery.of(context).size.height / 1.35,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.2, 0.8],
                        colors: [Colors.white, Colors.blue[50]])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Kasus Corona Indonesia',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Terakhir di update 21 Maret',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.4)),
                          ),
                          Spacer(),
                          Container(
                          height: 38,
                            child: FlatButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailIndonesia()));
                                },
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Lihat Detail ',
                                      style: TextStyle(
                                          color: Colors.green.withOpacity(0.8)),
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
                      height: MediaQuery.of(context).size.height / 4.5,
                      child: Card(
                        elevation: 1,
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(24)),
                        child: RefreshIndicator(
                          onRefresh: () => Provider.of<CoronaProvider>(context,
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
                                        Padding(padding: EdgeInsets.all(12)),
                                        Icon(
                                          Icons.home,
                                          size: 40,
                                          color: Colors.yellow,
                                        ),
                                        Text(
                                          data.summary.confirmed.toString(),
                                          style: TextStyle(
                                              color: Colors.yellow,
                                              fontSize: 40),
                                        ),
                                        Text('Kasus Positif',
                                            style: TextStyle(
                                                color: Colors.yellow)),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Padding(padding: EdgeInsets.all(12)),
                                        Icon(
                                          Icons.home,
                                          size: 40,
                                          color: Colors.green,
                                        ),
                                        Text(
                                          data.summary.recovered.toString(),
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 40),
                                        ),
                                        Text(
                                          'Sehat',
                                          style: TextStyle(color: Colors.green),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Padding(padding: EdgeInsets.all(12)),
                                        Icon(
                                          Icons.home,
                                          size: 40,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          data.summary.deaths.toString(),
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 40),
                                        ),
                                        Text('Meninggal',
                                            style:
                                                TextStyle(color: Colors.red)),
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
                            'Terakhir di update 21 Maret',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.4)),
                          ),
                          Spacer(),
                          Container(
                          height: 38,
                            child: FlatButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailIndonesia()));
                                },
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Lihat Detail ',
                                      style: TextStyle(
                                          color: Colors.green.withOpacity(0.8)),
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
                      height: MediaQuery.of(context).size.height / 4.4,
                      child: Card(
                        elevation: 1,
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(24)),
                        child: RefreshIndicator(
                          onRefresh: () => Provider.of<CoronaProvider>(context,
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
                                        Padding(padding: EdgeInsets.all(12)),
                                        Icon(
                                          Icons.home,
                                          size: 40,
                                          color: Colors.yellow,
                                        ),
                                        Text(
                                          data.world.confirmed.toString(),
                                          style: TextStyle(
                                              color: Colors.yellow,
                                              fontSize: 30),
                                        ),
                                        Text('Kasus Positif',
                                            style: TextStyle(
                                                color: Colors.yellow)),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Padding(padding: EdgeInsets.all(12)),
                                        Icon(
                                          Icons.home,
                                          size: 40,
                                          color: Colors.green,
                                        ),
                                        Text(
                                          data.world.recovered.toString(),
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 30),
                                        ),
                                        Text(
                                          'Sehat',
                                          style: TextStyle(color: Colors.green),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Padding(padding: EdgeInsets.all(12)),
                                        Icon(
                                          Icons.home,
                                          size: 40,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          data.world.deaths.toString(),
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 30),
                                        ),
                                        Text('Meninggal',
                                            style:
                                                TextStyle(color: Colors.red)),
                                      ],
                                    )
                                  ],
                                );
                              });
                            },
                          ),
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
