import 'package:domain/usecases/usecase.dart';

import '../repository/cart_repository.dart';

class UpdateCartUseCase implements FutureUseCase<Map<String, dynamic>, void> {
  final CartRepository _cartRepository;

  const UpdateCartUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<void> execute(Map<String, dynamic> input) async {
    _cartRepository.updateCart(input);
  }
}
