// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String name;
  int age;
  String Bio;
  String interests;
  String gender;
  int mobile;
  UserModel({
    required this.name,
    required this.age,
    required this.Bio,
    required this.interests,
    required this.gender,
    required this.mobile,
  });

  UserModel copyWith({
    String? name,
    int? age,
    String? Bio,
    String? interests,
    String? gender,
    int? mobile,
  }) {
    return UserModel(
      name: name ?? this.name,
      age: age ?? this.age,
      Bio: Bio ?? this.Bio,
      interests: interests ?? this.interests,
      gender: gender ?? this.gender,
      mobile: mobile ?? this.mobile,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'Bio': Bio,
      'interests': interests,
      'gender': gender,
      'mobile': mobile,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      age: map['age'] as int,
      Bio: map['Bio'] as String,
      interests: map['interests'] as String,
      gender: map['gender'] as String,
      mobile: map['mobile'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, age: $age, Bio: $Bio, interests: $interests, gender: $gender, mobile: $mobile)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.age == age &&
        other.Bio == Bio &&
        other.interests == interests &&
        other.gender == gender &&
        other.mobile == mobile;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        age.hashCode ^
        Bio.hashCode ^
        interests.hashCode ^
        gender.hashCode ^
        mobile.hashCode;
  }
}
