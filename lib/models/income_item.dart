import 'package:json_annotation/json_annotation.dart';

part 'income_item.g.dart';

@JsonSerializable()
class IncomeResponse {
    IncomeResponse({
        required this.data,
    });

    final List<IncomeItem>? data;

    factory IncomeResponse.fromJson(Map<String, dynamic> json) => _$IncomeResponseFromJson(json);

    Map<String, dynamic> toJson() => _$IncomeResponseToJson(this);

}

@JsonSerializable()
class IncomeItem {
    IncomeItem({
        required this.id,
        required this.nameOfRevenue,
        required this.amount,
    });

    final String? id;
    final String? nameOfRevenue;
    final int? amount;

    factory IncomeItem.fromJson(Map<String, dynamic> json) => _$IncomeItemFromJson(json);

    Map<String, dynamic> toJson() => _$IncomeItemToJson(this);

}
