
import 'package:clinic_booking_app/core/utils/assets_data.dart';

class RegisterModel {
  String? email;
  String? userName;
  String? birthDate;
  String? uId;
  String? gender;
  String? profileImage = AssetsData.defaultImage;

  RegisterModel({
    required this.email,
    required this.userName,
    required this.birthDate,
    required this.uId,
    required this.profileImage,
  });

  RegisterModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    userName = json['userName'];
    birthDate = json['birthDate'];
    uId = json['uId'];
    profileImage = json['profileImage'];
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'userName': userName,
      'birthDate': birthDate,
      'uId': uId,
      'profileImage': profileImage,
    };
  }
}
