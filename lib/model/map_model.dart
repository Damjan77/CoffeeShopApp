// class MapModel {
//   MapModel({
//     required this.id,
//     required this.name,
//     required this.address,
//     required this.capacity,
//     required this.city,
//     required this.isVirtualStation,
//     required this.latitude,
//     required this.longitude,
//     required this.zip,
//   });
//
//   late final int id;
//   late final String name;
//   late final String address;
//   late final int capacity;
//   late final String city;
//   late final bool isVirtualStation;
//   late final double latitude;
//   late final double longitude;
//   late final String zip;
//
//   MapModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     address = json['address'];
//     capacity = json['capacity'];
//     city = json['city'];
//     isVirtualStation = json['isVirtualStation'];
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//     zip = json['zip'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['address'] = address;
//     _data['capacity'] = capacity;
//     _data['city'] = city;
//     _data['isVirtualStation'] = isVirtualStation;
//     _data['latitude'] = latitude;
//     _data['longitude'] = longitude;
//     _data['zip'] = zip;
//     return _data;
//   }
// }


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
    // openingHours = OpeningHours.fromJson(json['opening_hours']);
    // if (json['photos'] != null) {
    //   photos = <Photos>[];
    //   json['photos'].forEach((v) {
    //     photos.add(Photos.fromJson(v));
    //   });
    // }
    placeId = json['place_id'];
    // plusCode = (json['plus_code'] != null
    //     ? PlusCode.fromJson(json['plus_code'])
    //     : null)!;
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
    // if (this.openingHours != null) {
    //   data['opening_hours'] = this.openingHours.toJson();
    // }
    // if (this.photos != null) {
    //   data['photos'] = this.photos.map((v) => v.toJson()).toList();
    // }
    data['place_id'] = this.placeId;
    // if (this.plusCode != null) {
    //   data['plus_code'] = this.plusCode.toJson();
    // }
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

// class OpeningHours {
//   late final bool openNow;
//
//   OpeningHours({required this.openNow});
//
//   OpeningHours.fromJson(Map<String, dynamic> json) {
//     openNow = json['open_now'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['open_now'] = this.openNow;
//     return data;
//   }
// }

// class Photos {
//   late final int height;
//   late final List<String> htmlAttributions;
//   late final String photoReference;
//   late final int width;
//
//   Photos({required this.height, required this.htmlAttributions, required this.photoReference, required this.width});
//
//   Photos.fromJson(Map<String, dynamic> json) {
//     height = json['height'];
//     htmlAttributions = json['html_attributions'].cast<String>();
//     photoReference = json['photo_reference'];
//     width = json['width'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['height'] = this.height;
//     data['html_attributions'] = this.htmlAttributions;
//     data['photo_reference'] = this.photoReference;
//     data['width'] = this.width;
//     return data;
//   }
// }

// class PlusCode {
//   late final String compoundCode;
//   late final String globalCode;
//
//   PlusCode({required this.compoundCode, required this.globalCode});
//
//   PlusCode.fromJson(Map<String, dynamic> json) {
//     compoundCode = json['compound_code'];
//     globalCode = json['global_code'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['compound_code'] = this.compoundCode;
//     data['global_code'] = this.globalCode;
//     return data;
//   }
// }
