import 'package:json_annotation/json_annotation.dart'; 
  
part 'home_page.g.dart';


@JsonSerializable()
  class HomePageModel extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'page')
  int page;

  @JsonKey(name: 'pagecount')
  int pagecount;

  @JsonKey(name: 'limit')
  String limit;

  @JsonKey(name: 'total')
  int total;

  // @JsonKey(name: 'list')
  // List<List> list;

  @JsonKey(name: 'class')
  List<TabBarType> typeBarList;

  HomePageModel(this.code,this.msg,this.page,this.pagecount,this.limit,this.total,this.typeBarList);

  factory HomePageModel.fromJson(Map<String, dynamic> srcJson) => _$HomePageModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomePageModelToJson(this);

}

  
// @JsonSerializable()
//   class List extends Object {

//   @JsonKey(name: 'vod_id')
//   int vodId;

//   @JsonKey(name: 'vod_name')
//   String vodName;

//   @JsonKey(name: 'type_id')
//   int typeId;

//   @JsonKey(name: 'type_name')
//   String typeName;

//   @JsonKey(name: 'vod_en')
//   String vodEn;

//   @JsonKey(name: 'vod_time')
//   String vodTime;

//   @JsonKey(name: 'vod_remarks')
//   String vodRemarks;

//   @JsonKey(name: 'vod_play_from')
//   String vodPlayFrom;

//   @JsonKey(name: 'vod_pic')
//   String vodPic;

//   List(this.vodId,this.vodName,this.typeId,this.typeName,this.vodEn,this.vodTime,this.vodRemarks,this.vodPlayFrom,this.vodPic,);

//   factory List.fromJson(Map<String, dynamic> srcJson) => _$ListFromJson(srcJson);

//   Map<String, dynamic> toJson() => _$ListToJson(this);

// }

  
@JsonSerializable()
  class TabBarType extends Object {

  @JsonKey(name: 'type_id')
  int typeId;

  @JsonKey(name: 'type_name')
  String typeName;

  TabBarType(this.typeId,this.typeName,);

  factory TabBarType.fromJson(Map<String, dynamic> srcJson) => _$TabBarTypeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TabBarTypeToJson(this);

}
