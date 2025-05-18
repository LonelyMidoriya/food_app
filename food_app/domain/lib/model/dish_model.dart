import 'package:domain/model/review_model.dart';

class DishModel {
  final String name;
  final String imageUrl;
  final double cost;
  final String type;
  final String description;
  final Map<dynamic, dynamic> stats;
  final List<ReviewModel> reviews;

  const DishModel({
    required this.name,
    required this.imageUrl,
    required this.cost,
    required this.type,
    required this.description,
    required this.stats,
    required this.reviews,
  });

  DishModel.empty()
      : name = '',
        imageUrl = '',
        cost = 0,
        type = '',
        description = '',
        stats = {
          'kcal': 0,
          'fats': 0,
          'carbohydrates': 0,
          'proteins': 0,
        },
        reviews = [];

  DishModel copyWith({
    String? name,
    String? imageUrl,
    double? cost,
    String? type,
    String? description,
    Map<dynamic, dynamic>? stats,
    List<ReviewModel>? reviews,
  }) =>
      DishModel(
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        cost: cost ?? this.cost,
        type: type ?? this.type,
        stats: stats ?? this.stats,
        description: description ?? this.description,
        reviews: reviews ?? this.reviews,
      );
}
