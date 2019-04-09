import 'package:credit_card_formatter/credit_card_formatter.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Credit card sample'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: new Center(
        child: CreditCard(
          cardWidth: 300.0,
          tradeMark: TradeMarkWidget.MASTERCARD,
          fullName: "Javier E. Comas",
          pan: "5543  2234  2344  2234",
          expiration: "02/20",
        ),
      ),
    );
  }
}
