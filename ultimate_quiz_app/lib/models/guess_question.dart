import 'package:json_annotation/json_annotation.dart';

part 'guess_question.g.dart';

@JsonSerializable()
class GuessQuestion {
  GuessQuestion({
    required this.answers,
    this.explanation,
    this.imageURL,
    this.correctAnswer,
  });

  factory GuessQuestion.fromJson(dynamic json) =>
      _$GuessQuestionFromJson(json as Map<String, dynamic>);
  Map<String, dynamic> toJson() => _$GuessQuestionToJson(this);

  @JsonKey(name: 'imageURL')
  String? imageURL;
  @JsonKey(name: 'objasnjenje')
  String? explanation;
  @JsonKey(name: 'tacan_odgovor')
  int? correctAnswer;
  @JsonKey(name: 'odgovori')
  List<String> answers;
}
