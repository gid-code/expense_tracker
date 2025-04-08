// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenditure_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpenditureResponse _$ExpenditureResponseFromJson(Map<String, dynamic> json) =>
    ExpenditureResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ExpenditureItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExpenditureResponseToJson(
        ExpenditureResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ExpenditureItem _$ExpenditureItemFromJson(Map<String, dynamic> json) =>
    ExpenditureItem(
      id: (json['id'] as num?)?.toInt(),
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      nameOfItem: json['name_of_expense'] as String?,
      estimatedAmount: (json['amount'] as num?)?.toDouble(),
      user: (json['user_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ExpenditureItemToJson(ExpenditureItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'nameOfItem': instance.nameOfItem,
      'estimatedAmount': instance.estimatedAmount,
      'user': instance.user,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
