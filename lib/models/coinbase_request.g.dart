// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coinbase_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinbaseRequest _$CoinbaseRequestFromJson(Map<String, dynamic> json) =>
    CoinbaseRequest(
      json['type'] as String,
      (json['channels'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$CoinbaseRequestToJson(CoinbaseRequest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'channels': instance.channels,
    };
