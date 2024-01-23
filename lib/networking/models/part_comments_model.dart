import 'package:freezed_annotation/freezed_annotation.dart';

part 'part_comments_model.freezed.dart';
part 'part_comments_model.g.dart';

@freezed
class PartCommentsModel with _$PartCommentsModel {
  const factory PartCommentsModel({
    @JsonKey(name: 'Comments')
    required String comments,
  }) = _PartCommentsModel;

  factory PartCommentsModel.fromJson(Map<String, dynamic> json) => _$PartCommentsModelFromJson(json);
}