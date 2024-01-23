import 'package:equatable/equatable.dart';

class RegisterUserModel extends Equatable {
  final Map<String, dynamic> user;
  final String accessToken;
  final String expiresAt;

  const RegisterUserModel({
    required this.user,
    required this.accessToken,
    required this.expiresAt,
  });

  @override
  List<Object> get props => [user, accessToken, expiresAt];

  factory RegisterUserModel.fromJson( json) {
    return RegisterUserModel(
      user: json['user'] ?? {},
      accessToken: json['access_token'] ?? '',
      expiresAt: json['expires_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'access_token': accessToken,
      'expires_at': expiresAt,
    };
  }

  @override
  bool get stringify => true;
}
