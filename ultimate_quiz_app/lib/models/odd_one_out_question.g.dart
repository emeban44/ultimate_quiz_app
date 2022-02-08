// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'odd_one_out_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OddOneOutQuestion _$OddOneOutQuestionFromJson(Map<String, dynamic> json) =>
    OddOneOutQuestion(
      answers:
          (json['odgovori'] as List<dynamic>).map((e) => e as String).toList(),
      explanation: json['objasnjenje'] as String?,
      correctAnswer: json['tacan_odgovor'] as int?,
    );

Map<String, dynamic> _$OddOneOutQuestionToJson(OddOneOutQuestion instance) =>
    <String, dynamic>{
      'objasnjenje': instance.explanation,
      'tacan_odgovor': instance.correctAnswer,
      'odgovori': instance.answers,
    };
