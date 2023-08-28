import 'package:coffe_shop_app/model/Coordinates.dart';

class Viewport {
  late final Coordinates northeast;
  late final Coordinates southwest;

  Viewport({required this.northeast, required this.southwest});

  Viewport.fromJson(Map<String, dynamic> json) {
    northeast = Coordinates.fromJson(json['northeast']);
    southwest = Coordinates.fromJson(json['southwest']);
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