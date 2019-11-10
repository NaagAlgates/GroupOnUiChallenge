class DashboardModel {
  List<Deals> deals;

  DashboardModel({this.deals});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    if (json['deals'] != null) {
      deals = new List<Deals>();
      json['deals'].forEach((v) {
        deals.add(new Deals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.deals != null) {
      data['deals'] = this.deals.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Deals {
  int id;
  String name;
  String imageUrl;
  int locationCount;
  String distance;
  double ratings;
  int reviews;
  String range;
  int originalCost;
  double discountedPrice;
  String discountSpecifications;
  String status;

  Deals(
      {this.id,
        this.name,
        this.imageUrl,
        this.locationCount,
        this.distance,
        this.ratings,
        this.reviews,
        this.range,
        this.originalCost,
        this.discountedPrice,
        this.discountSpecifications,
        this.status});

  Deals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    locationCount = json['locationCount'];
    distance = json['distance'];
    ratings = json['ratings'];
    reviews = json['reviews'];
    range = json['range'];
    originalCost = json['originalCost'];
    discountedPrice = json['discountedPrice'];
    discountSpecifications = json['discountSpecifications'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    data['locationCount'] = this.locationCount;
    data['distance'] = this.distance;
    data['ratings'] = this.ratings;
    data['reviews'] = this.reviews;
    data['range'] = this.range;
    data['originalCost'] = this.originalCost;
    data['discountedPrice'] = this.discountedPrice;
    data['discountSpecifications'] = this.discountSpecifications;
    data['status'] = this.status;
    return data;
  }
}
