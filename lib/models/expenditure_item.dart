import 'package:json_annotation/json_annotation.dart';

part 'expenditure_item.g.dart';

@JsonSerializable()
class ExpenditureResponse {
    ExpenditureResponse({
        required this.data,
    });

    final List<ExpenditureItem>? data;

    factory ExpenditureResponse.fromJson(Map<String, dynamic> json) => _$ExpenditureResponseFromJson(json);

    Map<String, dynamic> toJson() => _$ExpenditureResponseToJson(this);

}

@JsonSerializable()
class ExpenditureItem {
    ExpenditureItem({
        required this.id,
        required this.category,
        required this.nameOfItem,
        required this.estimatedAmount,
    });

    final String? id;
    final String? category;
    final String? nameOfItem;
    final int? estimatedAmount;

    factory ExpenditureItem.fromJson(Map<String, dynamic> json) => _$ExpenditureItemFromJson(json);

    Map<String, dynamic> toJson() => _$ExpenditureItemToJson(this);

}
