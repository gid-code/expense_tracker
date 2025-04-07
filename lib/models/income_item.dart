import 'package:json_annotation/json_annotation.dart';

part 'income_item.g.dart';

@JsonSerializable()
class IncomeResponse {
    IncomeResponse({
        required this.data,
    });

    factory IncomeResponse.fromJson(Map<String, dynamic> json) => _$IncomeResponseFromJson(json);

    final List<IncomeItem>? data;

    Map<String, dynamic> toJson() => _$IncomeResponseToJson(this);
}

@JsonSerializable()
class IncomeItem {
    IncomeItem({
        required this.id,
        required this.nameOfRevenue,
        required this.amount,
        required this.userId
    });

    factory IncomeItem.fromJson(Map<String, dynamic> json) => _$IncomeItemFromJson(json);

    final double? amount;
    final int? id;
    final String? nameOfRevenue;
    final int? userId;

    Map<String, dynamic> toJson() => _$IncomeItemToJson(this);
}
