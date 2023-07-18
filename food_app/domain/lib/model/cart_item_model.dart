class CartItemModel {
  final String name;
  final String imageUrl;
  final double cost;
  final String type;
  final String description;
  int count;

  CartItemModel({
    required this.name,
    required this.imageUrl,
    required this.cost,
    required this.type,
    required this.description,
    required this.count,
  });
}
