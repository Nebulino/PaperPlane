/**
 * PaperPlane - Just a Telegram Library for Dart
 * Copyright (c) 2020 Nebulino
 */

import 'package:paperplane/paperplane.dart';
import 'package:paperplane/types.dart';

/// It helps managing a [MessageEntity] or more inside a message.
extension MessageEntityHelper on Message {
  List<MessageEntity> getEntitiesByType(MessageEntityType type) {
    var entity_list = entities ?? caption_entities;
    for (var entity in entity_list) {
      if (entity.type != type.toString()) {
        entity_list.remove(entity);
      }
    }
    return entity_list;
  }

  int entityIndex(MessageEntityType type) {
    var entity_list = entities ?? caption_entities;

    if (entity_list != null) {
      for (var entity in entity_list) {
        if (entity.type == type.toString()) return entity_list.indexOf(entity);
      }
    }
    return -1;
  }

  MessageEntity getMessageEntity(MessageEntityType type) {
    var index = entityIndex(type);

    if (index >= 0) {
      return (entities ?? caption_entities)[index];
    }

    return null;
  }

  String getEntityText(MessageEntityType type) {
    var entity = getMessageEntity(type);

    if (entity != null) {
      return (text ?? caption)
          .substring(entity.offset, entity.offset + entity.length);
    }

    return null;
  }
}
