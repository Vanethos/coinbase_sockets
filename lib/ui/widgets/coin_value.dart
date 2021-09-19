import 'package:coinbase_sockets/models/coinbase_response.dart';
import 'package:coinbase_sockets/providers/coinbase_provider.dart';
import 'package:flutter/material.dart';

/// Coin Value
///
/// Shows the coin value for ETH and BTC when sockets are
/// open
class CoinValue extends StatefulWidget {
  final CoinbaseProvider provider;

  const CoinValue({
    required this.provider,
    Key? key,
  }) : super(key: key);

  @override
  State<CoinValue> createState() => _CoinValueState();
}

class _CoinValueState extends State<CoinValue> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Watching Coins:",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(
                  color: Colors.blueAccent,
                  width: 2.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CoinPrice(
                    color: Colors.blue,
                    stream: widget.provider.ethStream,
                  ),
                  CoinPrice(
                    color: Colors.orange,
                    stream: widget.provider.bitcoinStream,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class CoinPrice extends StatelessWidget {
  final Stream<CoinbaseResponse> stream;
  final Color color;

  const CoinPrice({
    required this.stream,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: StreamBuilder<CoinbaseResponse>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.connectionState == ConnectionState.active &&
              snapshot.hasData) {
            return Center(
              child: Text(
                '${snapshot.data!.productId}: ${snapshot.data!.price}',
                style: TextStyle(
                  color: color,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return const Center(
              child: Text('No more data'),
            );
          }

          return const Center(
            child: Text('No data'),
          );
        },
      ),
    );
  }
}
