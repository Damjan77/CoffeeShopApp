import 'Geometry.dart';

class MapModel {
  late final String businessStatus;
  late final Geometry geometry;
  late final String icon;
  late final String iconBackgroundColor;
  late final String iconMaskBaseUri;
  late final String name;
  late final String placeId;
  late final int priceLevel;
  late final num rating;
  late final String reference;
  late final String scope;
  late final List<String> types;
  late final int userRatingsTotal;
  late final String vicinity;

  MapModel(
      {required this.businessStatus,
      required this.geometry,
      required this.icon,
      required this.iconBackgroundColor,
      required this.iconMaskBaseUri,
      required this.name,
      required this.placeId,
      required this.priceLevel,
      required this.rating,
      required this.reference,
      required this.scope,
      required this.types,
      required this.userRatingsTotal,
      required this.vicinity});

  MapModel.fromJson(Map<String, dynamic> json) {
    businessStatus = json['business_status'];
    geometry = Geometry.fromJson(json['geometry']);
    icon = json['icon'];
    iconBackgroundColor = json['icon_background_color'];
    iconMaskBaseUri = json['icon_mask_base_uri'];
    name = json['name'];
    placeId = json['place_id'];
    priceLevel = json['price_level'];
    rating = json['rating'];
    reference = json['reference'];
    scope = json['scope'];
    types = json['types'].cast<String>();
    userRatingsTotal = json['user_ratings_total'];
    vicinity = json['vicinity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['business_status'] = this.businessStatus;
    if (this.geometry != null) {
      data['geometry'] = this.geometry.toJson();
    }
    data['icon'] = this.icon;
    data['icon_background_color'] = this.iconBackgroundColor;
    data['icon_mask_base_uri'] = this.iconMaskBaseUri;
    data['name'] = this.name;
    data['place_id'] = this.placeId;
    data['price_level'] = this.priceLevel;
    data['rating'] = this.rating;
    data['reference'] = this.reference;
    data['scope'] = this.scope;
    data['types'] = this.types;
    data['user_ratings_total'] = this.userRatingsTotal;
    data['vicinity'] = this.vicinity;
    return data;
  }
}
