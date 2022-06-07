
class UsersLocationModel {
  UsersLocationModel({
    required this.users,
  });

  List<User> users;

  factory UsersLocationModel.fromJson(Map<String, dynamic> json) =>
      UsersLocationModel(
        users: json["users"]
            
            =
            List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "users": users == null
            ? null
            : List<dynamic>.from(users.map((x) => x.toJson())),
      };
}

class User {
  User({
    required this.name,
    required this.age,
  });

  String name;
  int age;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"] == null ? null : json["name"],
        age: json["age"] == null ? null : json["age"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "age": age == null ? null : age,
      };
}
