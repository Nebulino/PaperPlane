// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Poll _$PollFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'id',
      'question',
      'options',
      'total_voter_count',
      'is_closed',
      'is_anonymous',
      'type',
      'allows_multiple_answers',
    ],
  );
  return Poll(
    id: json['id'] as String?,
    question: json['question'] as String?,
    options: (json['options'] as List<dynamic>?)
        ?.map((e) => PollOption.fromJson(e as Map<String, dynamic>))
        .toList(),
    totalVoterCount: (json['total_voter_count'] as num?)?.toInt(),
    isClosed: json['is_closed'] as bool?,
    isAnonymous: json['is_anonymous'] as bool?,
    type: $enumDecodeNullable(_$PollTypeEnumMap, json['type']),
    allowsMultipleAnswers: json['allows_multiple_answers'] as bool?,
    correctOptionID: (json['correct_option_id'] as num?)?.toInt(),
    explanation: json['explanation'] as String?,
    explanation_entities: (json['explanation_entities'] as List<dynamic>?)
        ?.map((e) => MessageEntity.fromJson(e as Map<String, dynamic>))
        .toList(),
    openPeriod: Poll._durationFromTelegramSeconds(
      (json['open_period'] as num?)?.toInt(),
    ),
    closeDate: Poll._dateTimeFromTelegramInt(
      (json['close_date'] as num?)?.toInt(),
    ),
  );
}

Map<String, dynamic> _$PollToJson(Poll instance) => <String, dynamic>{
  'id': ?instance.id,
  'question': ?instance.question,
  'options': ?instance.options,
  'total_voter_count': ?instance.totalVoterCount,
  'is_closed': ?instance.isClosed,
  'is_anonymous': ?instance.isAnonymous,
  'type': ?_$PollTypeEnumMap[instance.type],
  'allows_multiple_answers': ?instance.allowsMultipleAnswers,
  'correct_option_id': ?instance.correctOptionID,
  'explanation': ?instance.explanation,
  'explanation_entities': ?instance.explanation_entities,
  'open_period': ?Poll._durationToTelegramSeconds(instance.openPeriod),
  'close_date': ?Poll._dateTimeToTelegramInt(instance.closeDate),
};

const _$PollTypeEnumMap = {PollType.QUIZ: 'QUIZ', PollType.REGULAR: 'REGULAR'};

PollAnswer _$PollAnswerFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['poll_id', 'user', 'options_ids']);
  return PollAnswer(
    pollID: json['poll_id'] as String?,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    optionsIDs: (json['options_ids'] as List<dynamic>?)
        ?.map((e) => (e as num).toInt())
        .toList(),
  );
}

Map<String, dynamic> _$PollAnswerToJson(PollAnswer instance) =>
    <String, dynamic>{
      'poll_id': ?instance.pollID,
      'user': ?instance.user,
      'options_ids': ?instance.optionsIDs,
    };

PollOption _$PollOptionFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['text', 'voter_count']);
  return PollOption(
    text: json['text'] as String?,
    voterCount: (json['voter_count'] as num?)?.toInt(),
  );
}

Map<String, dynamic> _$PollOptionToJson(PollOption instance) =>
    <String, dynamic>{
      'text': ?instance.text,
      'voter_count': ?instance.voterCount,
    };
