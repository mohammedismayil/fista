import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.statusMessage,
    required this.statusCode,
    required this.restaurantDetails,
  });

  String statusMessage;
  String statusCode;
  RestaurantDetails restaurantDetails;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        statusMessage: json["status_message"],
        statusCode: json["status_code"],
        restaurantDetails:
            RestaurantDetails.fromJson(json["restaurant_details"]),
      );

  Map<String, dynamic> toJson() => {
        "status_message": statusMessage,
        "status_code": statusCode,
        "restaurant_details": restaurantDetails.toJson(),
      };
}

class RestaurantDetails {
  RestaurantDetails({
    required this.image,
    required this.name,
    required this.distance,
    required this.preparationTime,
    required this.ratings,
    required this.description,
    required this.cartCount,
  });

  String image;
  String name;
  String distance;
  String preparationTime;
  String ratings;
  String description;
  String cartCount;

  factory RestaurantDetails.fromJson(Map<String, dynamic> json) =>
      RestaurantDetails(
        image: json["image"],
        name: json["name"],
        distance: json["distance"],
        preparationTime: json["preparation_time"],
        ratings: json["ratings"],
        description: json["description"],
        cartCount: json["cart_count"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "distance": distance,
        "preparation_time": preparationTime,
        "ratings": ratings,
        "description": description,
        "cart_count": cartCount,
      };
}
