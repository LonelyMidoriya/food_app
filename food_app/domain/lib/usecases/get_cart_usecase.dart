import 'package:domain/usecases/usecase.dart';

import '../model/cart_model.dart';
import '../repository/cart_repository.dart';

class GetCartUseCase implements FutureUseCase<NoParams, CartModel> {
  final CartRepository _cartRepository;

  const GetCartUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<CartModel> execute(NoParams input) async {
    return _cartRepository.getCart();
  }
}
