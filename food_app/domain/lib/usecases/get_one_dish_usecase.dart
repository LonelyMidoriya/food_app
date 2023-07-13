import 'package:domain/model/dish_model.dart';
import 'package:domain/usecases/usecase.dart';
import '../repository/cart_repository.dart';

class GetOneDishUseCase implements FutureUseCase<String, DishModel> {
  final CartRepository _cartRepository;

  const GetOneDishUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<DishModel> execute(String input) async {
    return _cartRepository.getDish(input);
  }
}
