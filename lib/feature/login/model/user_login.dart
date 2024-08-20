// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'dart:convert';

class User {
  final int? userId;
   String? name;
   String? email;
   String? phone;
   String? image;
   String? location;
   String? driverType;
 
  User({
    this.userId,
     this.image,
     this.location,
     this.name,
     this.email,
    this.phone,
    this.driverType
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'name': name,
      'email': email,
      'phone': phone,
      'images': image,
      'location': location,
      'driverType': driverType,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['userId'] != null ? map['userId'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
      driverType: map['driverType'] != null ? map['driverType'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
}
