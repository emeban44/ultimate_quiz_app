// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort_by_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SortByQuestion _$SortByQuestionFromJson(Map<String, dynamic> json) =>
    SortByQuestion(
      correctList: (json['tacan_poredak'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      question: json['pitanje'] as String?,
      shuffledList: (json['shuffle_poredak'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SortByQuestionToJson(SortByQuestion instance) =>
    <String, dynamic>{
      'pitanje': instance.question,
      'tacan_poredak': instance.correctList,
      'shuffle_poredak': instance.shuffledList,
    };
