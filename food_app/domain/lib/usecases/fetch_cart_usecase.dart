import 'package:domain/domain.dart';

class FetchCartUseCase implements FutureUseCase<NoParams, CartModel> {
  final CartRepository _cartRepository;

  const FetchCartUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<CartModel> execute(NoParams input) async {
    return _cartRepository.fetchCart();
  }
}
