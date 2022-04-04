import 'package:json_annotation/json_annotation.dart';

part 'general_knowledge_question.g.dart';

@JsonSerializable()
class GeneralKnowledgeQuestion {
  GeneralKnowledgeQuestion({
    this.question,
    this.acceptedAnswers,
    this.category,
    this.correctAnswer,
  });

  factory GeneralKnowledgeQuestion.fromJson(dynamic json) =>
      _$GeneralKnowledgeQuestionFromJson(json as Map<String, dynamic>);
  Map<String, dynamic> toJson() => _$GeneralKnowledgeQuestionToJson(this);

  @JsonKey(name: 'pitanje')
  String? question;
  @JsonKey(name: 'tacan_odgovor')
  String? correctAnswer;
  @JsonKey(name: 'kategorija')
  String? category;
  @JsonKey(name: 'tacni_odgovori')
  List<String>? acceptedAnswers;
}
