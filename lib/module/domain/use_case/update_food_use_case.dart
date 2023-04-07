import '../../external/libraries/dartz.dart';
import '../entity/failure.dart';
import '../entity/food_entity.dart';
import '../repositories/app_repository.dart';
import 'use_case.dart';

class UpdateFoodUseCase implements UseCase<FoodEntity, FoodEntity> {
  final AppRepository repository;

  UpdateFoodUseCase({required this.repository});

  @override
  Future<Either<Failure, FoodEntity>> call(FoodEntity params) {
    return repository.updateFood(params);
  }
}
