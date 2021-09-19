import 'package:coinbase_sockets/providers/coinbase_provider.dart';
import 'package:coinbase_sockets/ui/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CoinbaseProApp extends StatelessWidget {
  late final CoinbaseProvider _provider;

  CoinbaseProApp({Key? key})
      : _provider = CoinbaseProvider(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(provider: _provider),
    );
  }
}
