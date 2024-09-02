// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IncomeResponse _$IncomeResponseFromJson(Map<String, dynamic> json) =>
    IncomeResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => IncomeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IncomeResponseToJson(IncomeResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

IncomeItem _$IncomeItemFromJson(Map<String, dynamic> json) => IncomeItem(
      id: json['id'] as String?,
      nameOfRevenue: json['nameOfRevenue'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$IncomeItemToJson(IncomeItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameOfRevenue': instance.nameOfRevenue,
      'amount': instance.amount,
    };
