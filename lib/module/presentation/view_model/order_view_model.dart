import '../../domain/entity/food_entity.dart';
import '../../domain/entity/selected_food_entity.dart';
import '../../domain/use_case/app_usecases.dart';
import '../../external/provider/app_provider.dart';
import 'general_state.dart';

class OrderViewModel extends AppChangeNotifier {
  final AppUseCase useCase;
  List<FoodEntity> listFood = [];

  List<SelectedFoodEntity> selectedFood = [];
  int totalPayment = 0;

  bool _isExpand = false;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  bool get isExpand => _isExpand;

  set isExpand(bool value) {
    _isExpand = value;
    notifyListeners();
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  OrderViewModel({required this.useCase});

  Future<GeneralState> getFood() async {
    try {
      final state = await useCase.getFood();

      return state.fold(
        (l) => const GeneralState.clientError(),
        (data) {
          listFood = data;
          notifyListeners();

          return const GeneralState.success();
        },
      );
    } catch (e) {
      return const GeneralState.clientError();
    }
  }

  Future<GeneralState> selectFood(FoodEntity food, int qty) async {
    try {
      isLoading = true;
      if (selectedFood.indexWhere((el) => el.id == food.id) == -1) {
        final selected = SelectedFoodEntity(
          id: food.id,
          name: food.name,
          picture: food.picture,
          picture_ori: food.picture_ori,
          price: int.parse(food.price!),
          qty: 1,
          subtotal: int.parse(food.price!),
        );
        selectedFood.add(selected);
      } else {
        final index = selectedFood.indexWhere((el) => el.id == food.id);
        final selected = selectedFood[index];

        final newValue = SelectedFoodEntity(
          id: selected.id,
          name: selected.name,
          picture: selected.picture,
          picture_ori: selected.picture_ori,
          price: selected.price,
          qty: selected.qty + qty,
          subtotal: selected.price * (selected.qty + qty),
        );
        selectedFood.removeAt(index);

        if (selected.qty + qty > 0) {
          selectedFood.insert(index, newValue);
        }
      }

      notifyListeners();

      return const GeneralState.success();
    } catch (e) {
      return const GeneralState.clientError();
    } finally {
      _totalCounter();
      isLoading = false;
    }
  }

  _totalCounter() {
    int total = 0;
    for (int index = 0; index < selectedFood.length; index++) {
      total += selectedFood[index].subtotal;
    }

    totalPayment = total;
  }
}
