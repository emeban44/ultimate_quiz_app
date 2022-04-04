// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_knowledge_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralKnowledgeQuestion _$GeneralKnowledgeQuestionFromJson(
        Map<String, dynamic> json) =>
    GeneralKnowledgeQuestion(
      question: json['pitanje'] as String?,
      acceptedAnswers: (json['tacni_odgovori'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      category: json['kategorija'] as String?,
      correctAnswer: json['tacan_odgovor'] as String?,
    );

Map<String, dynamic> _$GeneralKnowledgeQuestionToJson(
        GeneralKnowledgeQuestion instance) =>
    <String, dynamic>{
      'pitanje': instance.question,
      'tacan_odgovor': instance.correctAnswer,
      'kategorija': instance.category,
      'tacni_odgovori': instance.acceptedAnswers,
    };
