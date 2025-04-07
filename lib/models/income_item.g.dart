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
      id: (json['id'] as num?)?.toInt(),
      nameOfRevenue: json['name_of_revenue'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      userId: (json['user_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$IncomeItemToJson(IncomeItem instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'id': instance.id,
      'nameOfRevenue': instance.nameOfRevenue,
      'userId': instance.userId,
    };
