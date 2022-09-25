import 'package:flutter_flower/generated/json/base/json_field.dart';
import 'package:flutter_flower/generated/json/user_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class UserEntity {

	String? name;
	String? id;
	String? token;
  
  UserEntity({this.name,this.id,this.token});

  factory UserEntity.fromJson(Map<String, dynamic> json) => $UserEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}