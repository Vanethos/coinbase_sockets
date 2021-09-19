import 'dart:async';
import 'dart:convert';

import 'package:coinbase_sockets/models/coinbase_request.dart';
import 'package:coinbase_sockets/models/coinbase_response.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// Manages opening and closing the sockets for the
/// two different sockets: ETH socker and BTC socket
class CoinbaseProvider {
  late final WebSocketChannel _ethWebsocket;

  late final WebSocketChannel _btcWebsocket;

  static const _btcProduct = "BTC-EUR";

  static const _ethProduct = "ETH-EUR";

  CoinbaseProvider()
      : _ethWebsocket = WebSocketChannel.connect(
          Uri.parse('wss://ws-feed.pro.coinbase.com'),
        ),
        _btcWebsocket = WebSocketChannel.connect(
          Uri.parse('wss://ws-feed.pro.coinbase.com'),
        );

  @visibleForTesting
  CoinbaseProvider.testing(this._btcWebsocket, this._ethWebsocket);

  Stream<CoinbaseResponse> get bitcoinStream => _btcWebsocket.stream
      .map<CoinbaseResponse>(
          (value) => CoinbaseResponse.fromJson(jsonDecode(value)))
      .skipWhile((element) => element.productId != _btcProduct);

  Stream<CoinbaseResponse> get ethStream => _ethWebsocket.stream
      .map<CoinbaseResponse>(
          (value) => CoinbaseResponse.fromJson(jsonDecode(value)))
      .skipWhile((element) => element.productId != _ethProduct);

  void openBitcoin() {
    _btcWebsocket.sink.add(
      jsonEncode(
        CoinbaseRequest(
          'subscribe',
          [
            {
              "name": "ticker",
              "product_ids": [_btcProduct]
            }
          ],
        ).toJson(),
      ),
    );
  }

  void closeBitcoin() {
    _btcWebsocket.sink.close();
  }

  void openEthereum() {
    _ethWebsocket.sink.add(
      jsonEncode(
        CoinbaseRequest(
          'subscribe',
          [
            {
              "name": "ticker",
              "product_ids": [_ethProduct]
            }
          ],
        ).toJson(),
      ),
    );
  }

  void closeEthereum() {
    _ethWebsocket.sink.close();
  }
}
