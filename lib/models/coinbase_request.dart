import 'package:json_annotation/json_annotation.dart';

part 'coinbase_request.g.dart';

@JsonSerializable()
class CoinbaseRequest {
  final String type;
  final List<Map<String, dynamic>> channels;

  CoinbaseRequest(this.type, this.channels);

  factory CoinbaseRequest.fromJson(Map<String, dynamic> json) =>
      _$CoinbaseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CoinbaseRequestToJson(this);
}
