import 'package:coinbase_sockets/providers/coinbase_provider.dart';
import 'package:coinbase_sockets/ui/widgets/coin_buttons.dart';
import 'package:coinbase_sockets/ui/widgets/coin_value.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.provider}) : super(key: key);

  final CoinbaseProvider provider;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(
        0.9,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: CoinValue(
                  provider: widget.provider,
                ),
                flex: 4,
              ),
              Expanded(
                flex: 2,
                child: CoinButtons(
                  provider: widget.provider,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
