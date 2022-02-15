// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guess_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuessQuestion _$GuessQuestionFromJson(Map<String, dynamic> json) =>
    GuessQuestion(
      answers:
          (json['odgovori'] as List<dynamic>).map((e) => e as String).toList(),
      explanation: json['imageURL'] as String?,
      correctAnswer: json['tacan_odgovor'] as int?,
    );

Map<String, dynamic> _$GuessQuestionToJson(GuessQuestion instance) =>
    <String, dynamic>{
      'imageURL': instance.explanation,
      'tacan_odgovor': instance.correctAnswer,
      'odgovori': instance.answers,
    };
