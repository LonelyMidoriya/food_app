import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:dishes_view/src/widget/review_button.dart';
import 'package:dishes_view/src/widget/review_tile.dart';
import 'package:domain/model/dish_model.dart';
import 'package:flutter/material.dart';

class DishDescription extends StatelessWidget {
  final DishModel _dish;
  final bool _isAdmin;

  const DishDescription({
    required DishModel dish,
    required bool isAdmin,
    super.key,
  }) : _dish = dish,
        _isAdmin = isAdmin;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.sizeOf(context);
    double rating = 0;
    for(int i = 0; i < _dish.reviews.length; i++){
      rating += _dish.reviews[i].rating;
    }
    rating /= _dish.reviews.length;


    return Container(
      height: double.infinity,
      //color: theme.colorScheme.background,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.inversePrimary,
            theme.colorScheme.inverseSurface,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: _dish.imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  //height: size.height / 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                width: size.width / 1.3,
                height: size.width / 2,
                placeholder: (_, __) => const AppLoaderCenterWidget(),
                errorWidget: (_, __, ___) => const Center(
                  child: Text('Error'),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: theme.colorScheme.onTertiary.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: CustomText(
                        text: _dish.name,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: CustomText(
                        text: '${_dish.cost}\$',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    _dish.reviews.isNotEmpty ? Center(
                      child: StarRating(
                        size: 30.0,
                        rating: rating,
                        color: Colors.orange,
                        borderColor: Colors.grey,
                        allowHalfRating: true,
                        starCount: 5,
                      ),
                    ) : const CustomText(
                        text: "No reviews",
                        fontWeight: FontWeight.w800,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: CustomText(
                        text: _dish.description,
                        fontWeight: FontWeight.w500,
                        maxLines: 7,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Column(
                      children: _dish.stats.entries.map(
                        (MapEntry<dynamic, dynamic> entry) {
                          if (entry.key == 'kcal') {
                            return CustomProgressIndicator(
                              end: entry.value / 800,
                              stat: getStatShortForm(entry.key),
                              statValue: entry.value,
                            );
                          }
                          return CustomProgressIndicator(
                            end: entry.value / 80,
                            stat: getStatShortForm(entry.key),
                            statValue: entry.value,
                          );
                        },
                      ).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              _isAdmin ? const SizedBox(height: 0,) : ReviewButton(dish: _dish),
              const SizedBox(
                height: 15,
              ),
            _dish.reviews.isNotEmpty ? const CustomText(
              text: 'Reviews',
              fontWeight: FontWeight.w800,
            ) : const SizedBox(),
              const SizedBox(
                height: 15,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: _dish.reviews.length,
                itemBuilder: (BuildContext context, int index) {
                    return ReviewTile(
                      review:  _dish.reviews[index],
                    );
                } ,
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getStatShortForm(String stat) {
    if (stat == 'carbohydrates') {
      return 'CHO';
    } else if (stat == 'fats') {
      return 'Fats';
    } else if (stat == 'proteins') {
      return 'PRT';
    } else if (stat == 'kcal') {
      return 'KCal';
    } else {
      return 'Error';
    }
  }
}
