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
}
