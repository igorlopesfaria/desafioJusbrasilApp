import 'package:desafio_jusbrasil_app/style/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter_progress_button Example'),
      ),
        body: Container(
          child: Column(
            children: <Widget>[
              ProgressButton(
                defaultWidget:
                const Text('btn 5', style: TextStyle(color: Colors.blue)),
                progressWidget: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)),
                width: 114,
                onPressed: () async {
                  int score = await Future.delayed(
                      const Duration(milliseconds: 4000), () => 42);
                },
              ),
            ProgressButton(
              defaultWidget:
              const Text('btn 13', style: TextStyle(color: Colors.white)),
              progressWidget: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
              color: MainButtonColor,
              height: 45.0,
              borderRadius: 24,
              animate: false,
              onPressed: () async {
                int score = await Future.delayed(
                    const Duration(milliseconds: 4000), () => 42);
              },
            ),


            ],
          ),
        )

    );

  }
}
