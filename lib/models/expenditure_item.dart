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
        required this.user
    });

    final int? id;
    final Category? category;
    final String? nameOfItem;
    final double? estimatedAmount;
    final int? user;

    factory ExpenditureItem.fromJson(Map<String, dynamic> json) => _$ExpenditureItemFromJson(json);

    Map<String, dynamic> toJson() => _$ExpenditureItemToJson(this);

    @override
    String toString() => "id: $id, category: $category, nameOfItem: $nameOfItem, estimatedAmount: $estimatedAmount";

}

@JsonSerializable()
class Category {
    Category({
        required this.id,
        required this.name,
    });

    final int id;
    final String name;

    factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

    Map<String, dynamic> toJson() => _$CategoryToJson(this);

    @override
    String toString() => "name: $name";

}
