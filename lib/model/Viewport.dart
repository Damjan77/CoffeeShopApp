import 'package:coffe_shop_app/model/Location.dart';

class Viewport {
  late final Location northeast;
  late final Location southwest;

  Viewport({required this.northeast, required this.southwest});

  Viewport.fromJson(Map<String, dynamic> json) {
    northeast = Location.fromJson(json['northeast']);
    southwest = Location.fromJson(json['southwest']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.northeast != null) {
      data['northeast'] = this.northeast.toJson();
    }
    if (this.southwest != null) {
      data['southwest'] = this.southwest.toJson();
    }
    return data;
  }
}