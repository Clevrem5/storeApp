import 'package:freezed_annotation/freezed_annotation.dart';

part 'queryParam.g.dart';

@JsonSerializable(createFactory: false)
class QueryParam {
  final int? categoryId;
  final String? title;
  final int? sizeId;
  final double? maxPrise;
  final double? minPrise;
  final String? orderBy;

  const QueryParam({
    required this.title,
    required this.categoryId,
    required this.sizeId,
    required this.maxPrise,
    required this.orderBy,
    required this.minPrise,
  });

  Map<String, dynamic> toJson() => _$QueryParamToJson(
        this,
      );
}
