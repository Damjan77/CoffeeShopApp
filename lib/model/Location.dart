class Location {
  late final double lat;
  late final double lng;

  Location({
    required this.lat,
    required this.lng});

  Location.fromJson(Map<String, dynamic> json) {
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