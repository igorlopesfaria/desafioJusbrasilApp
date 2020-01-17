import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingDefault extends StatefulWidget {
  int _listSize = 0;

  LoadingDefault(this._listSize);


  @override
  State<StatefulWidget> createState() => _LoadingDefault(this._listSize);
}

class _LoadingDefault extends State<LoadingDefault> {
  int _listSize = 0;
  List<double> list = [110.0, 120.0, 130.0, 140.0, 150.0, 160.0];

  _LoadingDefault(this._listSize);

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
        child: Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  period: Duration(milliseconds: 900),
                  enabled: true,
                  child: Column(
                    children: new List<int>.generate(_listSize, (int index) => index + 1)
                        .map((_) => Padding(
                              padding: const EdgeInsets.only(bottom: 26.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        list[new Random().nextInt(list.length)],
                                    height: 28.0,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6.0),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            )));
  }
}
