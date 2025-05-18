import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class ReviewTile extends StatelessWidget {
  final ReviewModel _review;
  const ReviewTile({
    required ReviewModel review,
    super.key,
  }): _review = review;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.sizeOf(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurStyle: BlurStyle.normal,
            color: theme.colorScheme.secondaryContainer,
            blurRadius: 30.0,
            spreadRadius: 1.0,
            offset: const Offset(
              2.0,
              2.0,
            ),
          ),
        ],
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: <Widget>[
          CustomText(
            text: _review.email,
            fontWeight: FontWeight.w800,
          ),
          const SizedBox(
            height: 10,
          ),
          StarRating(
            size: 30.0,
            rating: _review.rating,
            color: Colors.orange,
            borderColor: Colors.grey,
            allowHalfRating: true,
            starCount: 5,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomText(
              text: _review.text,
              fontWeight: FontWeight.w500,
            maxLines: 7,
          ),
        ],
      ),
    );
  }
}
