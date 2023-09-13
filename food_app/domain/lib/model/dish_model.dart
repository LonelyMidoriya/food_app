class DishModel {
  final String name;
  final String imageUrl;
  final double cost;
  final String type;
  final String description;
  final Map<dynamic, dynamic> stats;

  const DishModel({
    required this.name,
    required this.imageUrl,
    required this.cost,
    required this.type,
    required this.description,
    required this.stats,
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
        };

  DishModel copyWith({
    String? name,
    String? imageUrl,
    double? cost,
    String? type,
    String? description,
    Map<dynamic, dynamic>? stats,
  }) =>
      DishModel(
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        cost: cost ?? this.cost,
        type: type ?? this.type,
        stats: stats ?? this.stats,
        description: description ?? this.description,
      );
}
