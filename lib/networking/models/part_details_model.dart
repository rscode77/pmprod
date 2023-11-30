import 'package:freezed_annotation/freezed_annotation.dart';

part 'part_details_model.freezed.dart';
part 'part_details_model.g.dart';

@freezed
class PartDetailsModel with _$PartDetailsModel {
  const factory PartDetailsModel({
    @JsonKey(name: 'ProductionOrder')
    required String productionOrder,
    @JsonKey(name: 'PartName')
    required String partName,
    @JsonKey(name: 'Quantity')
    required double quantity,
    @JsonKey(name: 'Contractor')
    required String contractor,
    @JsonKey(name: 'MainOrder')
    required String mainOrder,
    @JsonKey(name: 'PartSymbol')
    required String partSymbol,
    @JsonKey(name: 'Draw')
    required String? draw,
    @JsonKey(name: 'Material')
    required String material,
    @JsonKey(name: 'Deadline')
    required DateTime deadline,
    @JsonKey(name: 'RealizedQuantity')
    required double realizedQuantity,
    @JsonKey(name: 'PartUniqueId')
    required int partUniqueId,
    @JsonKey(name: 'Magazine')
    required Magazine magazine,
  }) = _PartDetailsModel;

  factory PartDetailsModel.fromJson(Map<String, dynamic> json) => _$PartDetailsModelFromJson(json);
}

enum Magazine {
  @JsonValue('MP1')
  mp1,
  @JsonValue('MP4')
  mp4,
  @JsonValue('MP6')
  mp6,
  @JsonValue('MP8')
  mp8,
}