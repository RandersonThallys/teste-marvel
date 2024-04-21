import 'package:code_hero/src/core/interactor/entities/thumbnail_entity.dart';

class ThumbnailAdapter {
  static ThumbnailEntity fromMap(Map map) {
    return ThumbnailEntity(
      path: map['path'],
      extension: map['extension'],
    );
  }

  static Map<String, dynamic> toMap(ThumbnailEntity thumbnailEntity) {
    return {
      'path': thumbnailEntity.path,
      'extension': thumbnailEntity.extension,
    };
  }
}
