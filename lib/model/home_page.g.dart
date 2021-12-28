// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePageModel _$HomePageModelFromJson(Map<String, dynamic> json) =>
    HomePageModel(
      json['code'] as int,
      json['msg'] as String,
      json['page'] as int,
      json['pagecount'] as int,
      json['limit'] as String,
      json['total'] as int,
      (json['class'] as List<dynamic>)
          .map((e) => TabBarType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomePageModelToJson(HomePageModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'page': instance.page,
      'pagecount': instance.pagecount,
      'limit': instance.limit,
      'total': instance.total,
      'class': instance.typeBarList,
    };

TabBarType _$TabBarTypeFromJson(Map<String, dynamic> json) => TabBarType(
      json['type_id'] as int,
      json['type_name'] as String,
    );

Map<String, dynamic> _$TabBarTypeToJson(TabBarType instance) =>
    <String, dynamic>{
      'type_id': instance.typeId,
      'type_name': instance.typeName,
    };
