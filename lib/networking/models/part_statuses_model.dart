import 'package:freezed_annotation/freezed_annotation.dart';

part 'part_statuses_model.freezed.dart';
part 'part_statuses_model.g.dart';

@freezed
abstract class PartStatusesModel with _$PartStatusesModel {
  const factory PartStatusesModel({
    @JsonKey(name: 'Quantity')
    required int quantity,
    @JsonKey(name: 'Date')
    required DateTime date,
    @JsonKey(name: 'Operator')
    required String operator,
    @JsonKey(name: 'PartName')
    required String partName,
    @JsonKey(name: 'Order')
    required String order,
    @JsonKey(name: 'RealizedQuantity')
    required int realizedQuantity,
    @JsonKey(name: 'Machine')
    required String machine,
    @JsonKey(name: 'Deadline')
    required String deadline,
  }) = _MissingPartModel;

  factory PartStatusesModel.fromJson(Map<String, dynamic> json) => _$PartStatusesModelFromJson(json);
}