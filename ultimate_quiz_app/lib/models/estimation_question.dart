import 'package:json_annotation/json_annotation.dart';

part 'estimation_question.g.dart';

@JsonSerializable()
class EstimationQuestion {
  EstimationQuestion({
    this.question,
    this.correctAnswer,
    this.isDecimal,
  });

  factory EstimationQuestion.fromJson(dynamic json) =>
      _$EstimationQuestionFromJson(json as Map<String, dynamic>);
  Map<String, dynamic> toJson() => _$EstimationQuestionToJson(this);

  @JsonKey(name: 'pitanje')
  String? question;
  @JsonKey(name: 'tacan_odgovor')
  String? correctAnswer;
  @JsonKey(name: 'ima_zarez')
  bool? isDecimal;
}
