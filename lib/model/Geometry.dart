import 'package:coffe_shop_app/model/Location.dart';
import 'package:coffe_shop_app/model/Viewport.dart';

class Geometry {
  late final Location location;
  late final Viewport viewport;

  Geometry({
    required this.location,
    required this.viewport});

  Geometry.fromJson(Map<String, dynamic> json) {
    location = Location.fromJson(json['location']);
    viewport = Viewport.fromJson(json['viewport']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.viewport != null) {
      data['viewport'] = this.viewport.toJson();
    }
    return data;
  }
}