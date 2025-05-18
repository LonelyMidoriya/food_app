import 'package:domain/model/review_model.dart';

import '../entity/review/review_entity.dart';

abstract class ReviewMapper {
  static ReviewEntity toEntity(ReviewModel model) {
    return ReviewEntity(
      email: model.email,
      text: model.text,
      rating: model.rating,
    );
  }

  static ReviewModel toModel(ReviewEntity entity) {
    return ReviewModel(
      email: entity.email,
      text: entity.text,
      rating: entity.rating,
    );
  }
}