// GENERATED CODE - DO NOT MODIFY BY HAND

part of poll;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Poll _$PollFromJson(Map<String, dynamic> json) {
  return Poll(
    id: json['id'] as String,
    question: json['question'] as String,
    options: (json['options'] as List)
        ?.map((e) =>
            e == null ? null : PollOption.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    total_voter_count: json['total_voter_count'] as int,
    is_closed: json['is_closed'] as bool,
    is_anonymous: json['is_anonymous'] as bool,
    type: json['type'] as String,
    allows_multiple_answers: json['allows_multiple_answers'] as bool,
    correct_option_id: json['correct_option_id'] as int,
  );
}

Map<String, dynamic> _$PollToJson(Poll instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'options': instance.options,
      'total_voter_count': instance.total_voter_count,
      'is_closed': instance.is_closed,
      'is_anonymous': instance.is_anonymous,
      'type': instance.type,
      'allows_multiple_answers': instance.allows_multiple_answers,
      'correct_option_id': instance.correct_option_id,
    };

PollAnswer _$PollAnswerFromJson(Map<String, dynamic> json) {
  return PollAnswer(
    poll_id: json['poll_id'] as String,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    options_ids: (json['options_ids'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$PollAnswerToJson(PollAnswer instance) =>
    <String, dynamic>{
      'poll_id': instance.poll_id,
      'user': instance.user,
      'options_ids': instance.options_ids,
    };

PollOption _$PollOptionFromJson(Map<String, dynamic> json) {
  return PollOption(
    text: json['text'] as String,
    voter_count: json['voter_count'] as int,
  );
}

Map<String, dynamic> _$PollOptionToJson(PollOption instance) =>
    <String, dynamic>{
      'text': instance.text,
      'voter_count': instance.voter_count,
    };
