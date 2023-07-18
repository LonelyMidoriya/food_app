import 'package:domain/model/cart_model.dart';
import 'package:domain/usecases/usecase.dart';

import '../repository/cart_repository.dart';

class UpdateCartUseCase implements FutureUseCase<CartModel, void> {
  final CartRepository _cartRepository;

  const UpdateCartUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<void> execute(CartModel input) async {
    _cartRepository.updateCart(input);
  }
}
