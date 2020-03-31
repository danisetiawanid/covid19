import 'package:covid19app/provider/corona_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class RefreshDani extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () =>
            Provider.of<CoronaProvider>(context, listen: false).getData(),
        child: Container(
          margin: const EdgeInsets.all(10),
          child: FutureBuilder(
            future:
                Provider.of<CoronaProvider>(context, listen: false).getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Consumer<CoronaProvider>(
                builder: (context, data, _) {
                  return Column(
                    children: <Widget>[],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
