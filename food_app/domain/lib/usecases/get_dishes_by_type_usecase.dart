import 'package:domain/usecases/usecase.dart';
import 'package:domain/domain.dart';

class GetDishesByTypeUseCase
    implements FutureUseCase<List<dynamic>, List<DishModel>> {
  final DishesRepository _dishesRepository;

  const GetDishesByTypeUseCase({
    required DishesRepository dishesRepository,
  }) : _dishesRepository = dishesRepository;

  @override
  Future<List<DishModel>> execute(List<dynamic> input) async {
    return _dishesRepository.getAllDishesByType(input[0], input[1]);
  }
}
