/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'package:paperplane/helpers.dart';
import 'package:paperplane/telegram.dart';

/// It helps managing a [MessageEntity] or more inside a message.
extension MessageEntityHelper on Message {
  /// It returns the entities list of a type.
  List<MessageEntity> getEntitiesByType(MessageEntityType type) {
    var entity_list = entities ?? captionEntities;
    for (var entity in entity_list) {
      if (entity.type != type.toString()) {
        entity_list.remove(entity);
      }
    }
    return entity_list;
  }

  /// It returns the entity index given a type.
  int entityIndex(MessageEntityType type) {
    var entity_list = entities ?? captionEntities;

    if (entity_list != null) {
      for (var entity in entity_list) {
        if (entity.type == type.toString()) return entity_list.indexOf(entity);
      }
    }
    return -1;
  }

  /// It returns the message entity.
  MessageEntity getMessageEntity(MessageEntityType type) {
    var index = entityIndex(type);

    if (index >= 0) {
      return (entities ?? captionEntities)[index];
    }

    return null;
  }

  /// It returns the text of a given message entity.
  String getEntityText(MessageEntityType type) {
    var entity = getMessageEntity(type);

    if (entity != null) {
      return (text ?? caption)
          .substring(entity.offset, entity.offset + entity.length);
    }

    return null;
  }
}
