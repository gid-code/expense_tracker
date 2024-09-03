import 'package:json_annotation/json_annotation.dart';

part 'auth_models.g.dart';

@JsonSerializable()
class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable()
class LoginResponse {
  final String message;
  final String accessToken;
  final String expiresIn;

  LoginResponse({required this.message, required this.accessToken, required this.expiresIn});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
  class SignupRequest {
    final String name;
    final String email;
    final String password;

    SignupRequest({required this.name, required this.email, required this.password});

    factory SignupRequest.fromJson(Map<String, dynamic> json) => _$SignupRequestFromJson(json);
    Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
  }

  @JsonSerializable()
  class SignupResponse {
    final String message;

    SignupResponse({required this.message});

    factory SignupResponse.fromJson(Map<String, dynamic> json) => _$SignupResponseFromJson(json);
    Map<String, dynamic> toJson() => _$SignupResponseToJson(this);
  }

  @JsonSerializable()
  class UserProfile {
    final String name;
    final String email;

    UserProfile({required this.name, required this.email});

    factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
    Map<String, dynamic> toJson() => _$UserProfileToJson(this);

    String get firstName => name.split(' ')[0];
  }
