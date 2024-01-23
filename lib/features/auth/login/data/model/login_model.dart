import 'package:equatable/equatable.dart';

class LoginUserModel extends Equatable {
  final User? user;
  final String? accessToken;
  final String? expiresAt;

  const LoginUserModel({this.user, this.accessToken, this.expiresAt});

  @override
  List<Object?> get props => [user, accessToken, expiresAt];

  factory LoginUserModel.fromJson(Map<String, dynamic> json) {
    return LoginUserModel(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      accessToken: json['access_token'],
      expiresAt: json['expires_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'user': user?.toJson(),
      'access_token': accessToken,
      'expires_at': expiresAt,
    };
    return data;
  }
}

class User extends Equatable {
  final int? id;
  final int? roleId;
  final String? name;
  final String? email;
  final String? avatar;
  final dynamic? emailVerifiedAt;
  final dynamic? token;
  final dynamic? provider;
  final List<dynamic>? settings;
  final dynamic? otp;
  final String? createdAt;
  final String? updatedAt;

  const User({
    this.id,
    this.roleId,
    this.name,
    this.email,
    this.avatar,
    this.emailVerifiedAt,
    this.token,
    this.provider,
    this.settings,
    this.otp,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        roleId,
        name,
        email,
        avatar,
        emailVerifiedAt,
        token,
        provider,
        settings,
        otp,
        createdAt,
        updatedAt,
      ];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      roleId: json['role_id'],
      name: json['name'],
      email: json['email'],
      avatar: json['avatar'],
      emailVerifiedAt: json['email_verified_at'],
      token: json['token'],
      provider: json['provider'],
      settings: (json['settings'] as List?)?.cast<Null>(),
      otp: json['otp'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'role_id': roleId,
      'name': name,
      'email': email,
      'avatar': avatar,
      'email_verified_at': emailVerifiedAt,
      'token': token,
      'provider': provider,
      'settings': settings,
      'otp': otp,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
    return data;
  }
}
