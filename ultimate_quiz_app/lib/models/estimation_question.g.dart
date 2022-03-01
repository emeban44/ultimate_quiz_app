// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estimation_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstimationQuestion _$EstimationQuestionFromJson(Map<String, dynamic> json) =>
    EstimationQuestion(
      question: json['pitanje'] as String?,
      correctAnswer: json['tacan_odgovor'] as String?,
      isDecimal: json['ima_zarez'] as bool?,
    );

Map<String, dynamic> _$EstimationQuestionToJson(EstimationQuestion instance) =>
    <String, dynamic>{
      'pitanje': instance.question,
      'tacan_odgovor': instance.correctAnswer,
      'ima_zarez': instance.isDecimal,
    };
