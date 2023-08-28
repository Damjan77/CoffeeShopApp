class Coordinates {
  late final double lat;
  late final double lng;

  Coordinates({
    required this.lat,
    required this.lng});

  Coordinates.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}