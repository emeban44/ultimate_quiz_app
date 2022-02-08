import 'package:json_annotation/json_annotation.dart';

part 'odd_one_out_question.g.dart';

@JsonSerializable()
class OddOneOutQuestion {
  OddOneOutQuestion({
    required this.answers,
    this.explanation,
    this.correctAnswer,
  });

  factory OddOneOutQuestion.fromJson(dynamic json) =>
      _$OddOneOutQuestionFromJson(json as Map<String, dynamic>);
  Map<String, dynamic> toJson() => _$OddOneOutQuestionToJson(this);

  @JsonKey(name: 'objasnjenje')
  String? explanation;
  @JsonKey(name: 'tacan_odgovor')
  int? correctAnswer;
  @JsonKey(name: 'odgovori')
  List<String> answers;
}
