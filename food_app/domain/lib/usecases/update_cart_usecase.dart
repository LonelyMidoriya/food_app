import 'package:domain/usecases/usecase.dart';
import 'package:domain/domain.dart';

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
