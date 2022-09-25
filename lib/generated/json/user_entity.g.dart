import 'package:flutter_flower/generated/json/base/json_convert_content.dart';
import 'package:flutter_flower/models/user_entity.dart';

UserEntity $UserEntityFromJson(Map<String, dynamic> json) {
	final UserEntity userEntity = UserEntity();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		userEntity.name = name;
	}
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		userEntity.id = id;
	}
	final String? token = jsonConvert.convert<String>(json['token']);
	if (token != null) {
		userEntity.token = token;
	}
	return userEntity;
}

Map<String, dynamic> $UserEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['id'] = entity.id;
	data['token'] = entity.token;
	return data;
}