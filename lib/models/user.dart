class User {
  int id;
  String name;
  String email;
  dynamic image;
  String phone;

  User({
    this.id,
    this.name,
    this.email,
    this.image,
    this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['displayName'],
      email: json['email'],
      image: json['photoURL'],
      phone: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'image': image,
        'phone': phone,
      };
}
