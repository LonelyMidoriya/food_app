class CartItemModel {
  final String name;
  final String imageUrl;
  final double cost;
  final String type;
  final String description;
  final int count;

  CartItemModel({
    required this.name,
    required this.imageUrl,
    required this.cost,
    required this.type,
    required this.description,
    required this.count,
  });

  CartItemModel copyWith({
    String? name,
    String? imageUrl,
    double? cost,
    String? type,
    String? description,
    int? count,
  }) =>
      CartItemModel(
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        cost: cost ?? this.cost,
        type: type ?? this.type,
        description: description ?? this.description,
        count: count ?? this.count,
      );
}
