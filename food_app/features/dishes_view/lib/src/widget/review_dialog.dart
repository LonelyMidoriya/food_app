import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class ReviewDialog extends StatefulWidget {
  final ReviewModel _review;
  final DishModel _dish;
  const ReviewDialog({
    Key? key,
    required ReviewModel review,
    required DishModel dish,
  })  : _review = review,
        _dish = dish,
        super(key: key);

  @override
  State<ReviewDialog> createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {
  double newRating = 0;
  final TextEditingController reviewController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    reviewController.text = widget._review.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final DishesViewBloc dishesViewBloc =
    BlocProvider.of<DishesViewBloc>(context);
    final AuthViewBloc authViewBloc = BlocProvider.of<AuthViewBloc>(context);
    //newRating = widget._review.rating;

    return AlertDialog(
      insetPadding: EdgeInsets.only(
        top: size.height / 20,
        bottom: size.height / 20,
        right: size.width / 20,
        left: size.width / 20,
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      title: SizedBox(
        height: size.height / 30,
        width: size.width / 1.5,
        child: const CustomText(
          text: 'Leave a review',
          fontWeight: FontWeight.w900,
        ),
      ),
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                StarRating(
                  size: 40.0,
                  rating: newRating,
                  color: Colors.orange,
                  borderColor: Colors.grey,
                  allowHalfRating: true,
                  starCount: 5,
                  onRatingChanged: (rating) => setState(() {
                    newRating = rating;
                  }),
                ),
                TextFormField(
                  validator: textValidator,
                  maxLines: 3,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: reviewController,
                  decoration: const InputDecoration(
                    labelText: 'description',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
        SizedBox(
          width: size.width / 3,
          height: size.height / 15,
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() == true) {
                int index = widget._dish.reviews.indexWhere((element) => element.email == authViewBloc.state.user.email);
                widget._review.email.isEmpty ? widget._dish.reviews.add(
                  ReviewModel(
                    email: authViewBloc.state.user.email,
                    text: reviewController.text,
                    rating: newRating,
                  ),
                ) : {
                  widget._dish.reviews[index]
                  = ReviewModel(
                    email: authViewBloc.state.user.email,
                    text: reviewController.text,
                    rating: newRating,
                  )
                };
                dishesViewBloc.add(
                  UpdateDishEvent(
                    newDish: DishModel(
                      name: widget._dish.name,
                      imageUrl: widget._dish.imageUrl,
                      cost: widget._dish.cost,
                      type: widget._dish.type,
                      description: widget._dish.description,
                      stats: widget._dish.stats,
                      reviews:widget._dish.reviews,
                    ),
                    dish: widget._dish,
                  ),
                );
                  authViewBloc.add(
                    const PopUntilPageEvent(
                      route: HomePageRoute.name,
                    ),
                  );
              }
            },
            child: const CustomText(
              text: 'Save',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          width: size.width / 3,
          height: size.height / 15,
          child: ElevatedButton(
            onPressed: () => authViewBloc.add(
              PopToPreviousPageEvent(),
            ),
            child: const CustomText(
              text: 'Cancel',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
