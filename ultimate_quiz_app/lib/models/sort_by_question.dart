import 'package:json_annotation/json_annotation.dart';

part 'sort_by_question.g.dart';

@JsonSerializable()
class SortByQuestion {
  SortByQuestion({
    required this.correctList,
    required this.question,
    required this.shuffledList,
  });

  factory SortByQuestion.fromJson(dynamic json) =>
      _$SortByQuestionFromJson(json as Map<String, dynamic>);
  Map<String, dynamic> toJson() => _$SortByQuestionToJson(this);

  @JsonKey(name: 'pitanje')
  String? question;
  @JsonKey(name: 'tacan_poredak')
  List<String> correctList;
  @JsonKey(name: 'shuffle_poredak')
  List<String> shuffledList;
}
