import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductListLoading extends StatelessWidget {
  List<double> list = [110.0, 120.0, 130.0, 140.0, 150.0, 160.0];

  @override
  Widget build(BuildContext context) {

    return new SingleChildScrollView(
        child: Container(
            width: double.infinity,
//            padding:
//            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  period: Duration(milliseconds: 900),
                  enabled: true,
                  child: Column(
                    children:
                        new List<int>.generate(17, (int index) => index + 1)
                            .map((_) => Padding(
                                  padding: const EdgeInsets.only(bottom: 26.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 90.0,
                                        height: 90.0,
                                        color: Colors.white,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10.0),
                                        height: 90,
                                        child: new Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                width: list[new Random()
                                                    .nextInt(list.length)],
                                                height: 10.0,
                                                color: Colors.white,
                                              ),
                                              new Padding(
                                                  padding: new EdgeInsets.only(
                                                      top: 3.0)),
                                              Container(
                                                width: 70.0,
                                                height: 10.0,
                                                color: Colors.white,
                                              ),
                                            ]),
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
