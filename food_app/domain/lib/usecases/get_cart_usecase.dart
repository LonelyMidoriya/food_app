import 'package:domain/domain.dart';

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
