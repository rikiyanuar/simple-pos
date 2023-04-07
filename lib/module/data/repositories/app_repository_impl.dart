import '../../domain/entity/failure.dart';
import '../../domain/entity/food_entity.dart';
import '../../domain/repositories/app_repository.dart';
import '../../external/libraries/dartz.dart';
import '../../external/service/service_exception.dart';
import '../datasources/remote/app_remote_data_source.dart';

class AppRepositoryImpl extends AppRepository {
  final AppRemoteDataSource remoteDataSource;

  AppRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<FoodEntity>>> getFood() async {
    try {
      final response = await remoteDataSource.getFood();

      return Right(response);
    } on ServerErrorException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on ClientErrorException catch (e) {
      return Left(ClientFailure(message: e.message));
    } catch (e) {
      return Left(ClientFailure());
    }
  }

  @override
  Future<Either<Failure, FoodEntity>> insertFood(FoodEntity food) async {
    try {
      final response = await remoteDataSource.insertFood(food);

      return Right(response);
    } on ServerErrorException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on ClientErrorException catch (e) {
      return Left(ClientFailure(message: e.message));
    } catch (e) {
      return Left(ClientFailure());
    }
  }

  @override
  Future<Either<Failure, FoodEntity>> updateFood(FoodEntity food) async {
    try {
      final response = await remoteDataSource.updateFood(food);

      return Right(response);
    } on ServerErrorException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on ClientErrorException catch (e) {
      return Left(ClientFailure(message: e.message));
    } catch (e) {
      return Left(ClientFailure());
    }
  }

  @override
  Future<Either<Failure, FoodEntity>> deleteFood(FoodEntity food) async {
    try {
      final response = await remoteDataSource.deleteFood(food);

      return Right(response);
    } on ServerErrorException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on ClientErrorException catch (e) {
      return Left(ClientFailure(message: e.message));
    } catch (e) {
      return Left(ClientFailure());
    }
  }
}
