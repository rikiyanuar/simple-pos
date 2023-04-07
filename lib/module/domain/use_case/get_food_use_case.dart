import '../../external/libraries/dartz.dart';
import '../entity/failure.dart';
import '../entity/food_entity.dart';
import '../repositories/app_repository.dart';
import 'use_case.dart';

class GetFoodUseCase implements UseCase<List<FoodEntity>, NoParams> {
  final AppRepository repository;

  GetFoodUseCase({required this.repository});

  @override
  Future<Either<Failure, List<FoodEntity>>> call(NoParams params) {
    return repository.getFood();
  }
}
