import '../../external/libraries/dartz.dart';
import '../entity/failure.dart';
import '../entity/food_entity.dart';

abstract class AppRepository {
  Future<Either<Failure, List<FoodEntity>>> getFood();
  Future<Either<Failure, FoodEntity>> insertFood(FoodEntity food);
  Future<Either<Failure, FoodEntity>> updateFood(FoodEntity food);
  Future<Either<Failure, FoodEntity>> deleteFood(FoodEntity food);
}
