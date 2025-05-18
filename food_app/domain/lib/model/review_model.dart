class ReviewModel {
  final String email;
  final String text;
  final double rating;

  const ReviewModel({
    required this.email,
    required this.text,
    required this.rating,
  });

  ReviewModel copyWith({
    String? email,
    String? text,
    double? rating,
  }) =>
      ReviewModel(
        email: email ?? this.email,
        text: text ?? this.text,
        rating: rating ?? this.rating,
      );

  ReviewModel.empty()
      : email = '',
        text = '',
        rating = 0;
}