import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'store.g.dart';

@JsonSerializable()
class Store {
  final String id;
  final String title;
  final double latitude;
  final double longitude;
  final Map<String, int> stock;

  const Store({
    @required this.id,
    @required this.title,
    @required this.latitude,
    @required this.longitude,
    @required this.stock,
  });

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
  Map<String, dynamic> toJson() => _$StoreToJson(this);
}
