//                                               //
// PaperPlane - Just a Telegram Library for Dart //
//          Copyright (c) 2020 Nebulino          //
//                                               //

import 'package:paperplane/helpers.dart';
import 'package:paperplane/telegram.dart';

/// It helps managing a [MessageEntity] or more inside a message.
extension MessageEntityHelper on Message {
  /// It returns the entities list of a type.
  List<MessageEntity> getEntitiesByType(MessageEntityType type) {
    final entityList = entities ?? captionEntities;
    if (entityList == null) return [];
    return entityList
        .where((entity) => entity.type == type.toString())
        .toList();
  }

  /// It returns the entity index given a type.
  int entityIndex(MessageEntityType type) {
    final entityList = entities ?? captionEntities;
    if (entityList == null) return -1;
    return entityList.indexWhere((entity) => entity.type == type.toString());
  }

  /// It returns the message entity.
  MessageEntity? getMessageEntity(MessageEntityType type) {
    final entityList = entities ?? captionEntities;
    if (entityList == null) return null;
    final index = entityIndex(type);
    if (index >= 0 && index < entityList.length) {
      return entityList[index];
    }
    return null;
  }

  /// It returns the text of a given message entity.
  String? getEntityText(MessageEntityType type) {
    final entity = getMessageEntity(type);
    if (entity == null || entity.offset == null || entity.length == null) {
      return null;
    }
    final content = text ?? caption;
    if (content == null) return null;
    final start = entity.offset!;
    final end = start + entity.length!;
    if (start >= 0 && end <= content.length) {
      return content.substring(start, end);
    }
    return null;
  }
}
