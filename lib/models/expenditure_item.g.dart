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
      id: json['id'] as String?,
      category: json['category'] as String?,
      nameOfItem: json['nameOfItem'] as String?,
      estimatedAmount: (json['estimatedAmount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ExpenditureItemToJson(ExpenditureItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'nameOfItem': instance.nameOfItem,
      'estimatedAmount': instance.estimatedAmount,
    };
