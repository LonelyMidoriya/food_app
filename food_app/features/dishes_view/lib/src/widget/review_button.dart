import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:dishes_view/src/widget/review_dialog.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class ReviewButton extends StatelessWidget {
  final DishModel _dish;
  const ReviewButton({
    required DishModel dish,
    super.key
  }) : _dish = dish;

  @override
  Widget build(BuildContext context) {
    final DishesViewBloc dishViewBloc = BlocProvider.of<DishesViewBloc>(context);

    return BlocBuilder<AuthViewBloc, AuthViewState>(
        builder: (BuildContext context, AuthViewState authState) {
          return BlocBuilder<DishesViewBloc, DishesViewState>(
            builder: (BuildContext context, DishesViewState state) {
              ReviewModel review = const ReviewModel(email: '', text: '', rating: 0);
              for(int i = 0; i < _dish.reviews.length; i++)
              {
                if(_dish.reviews[i].email == authState.user.email){
                  review = _dish.reviews[i];
                }
              }
              if (!state.hasInternet) {
                return const SizedBox();
              } else {
                return ElevatedButton(
                  onPressed: () async {
                    showAnimatedDialog(
                      animationType: DialogTransitionType.fadeScale,
                      duration: const Duration(milliseconds: 500),
                      context: context,
                      builder: (BuildContext context) {

                        return ReviewDialog(
                            review: review,
                            dish: _dish,
                        );
                      },
                    );
                  },
                  child: review.email.isEmpty ? const CustomText(
                    text: 'Leave review',
                    fontWeight: FontWeight.w700,
                  ) : const CustomText(
                    text: 'Edit review',
                    fontWeight: FontWeight.w700,
                  ),
                );
              }
            },
          );
        }
    );
  }
}
