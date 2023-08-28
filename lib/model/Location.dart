import 'package:coffe_shop_app/model/Coordinates.dart';
import 'package:coffe_shop_app/model/Viewport.dart';

class Location {
  late final Coordinates coordinates;
  late final Viewport viewport;

  Location({
    required this.coordinates,
    required this.viewport});

  Location.fromJson(Map<String, dynamic> json) {
    coordinates = Coordinates.fromJson(json['location']);
    viewport = Viewport.fromJson(json['viewport']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.coordinates != null) {
      data['location'] = this.coordinates.toJson();
    }
    if (this.viewport != null) {
      data['viewport'] = this.viewport.toJson();
    }
    return data;
  }
}