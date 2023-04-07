import 'package:flutter/material.dart';

import '../../../domain/use_case/app_usecases.dart';
import '../../../external/constants/app_constant.dart';
import '../../../external/formatter/formatter.dart';
import '../../../external/libraries/libraries.dart';
import '../../view_model/food_view_model.dart';
import 'form_food_screen.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  FoodViewModel? _viewModel;

  @override
  void initState() {
    _viewModel = FoodViewModel(
      useCase: GetIt.I.get<AppUseCase>(),
      foodEntity: null,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshIndicatorKey.currentState!.show();
      _getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _viewModel!,
      child: Consumer<FoodViewModel>(
        builder: (_, __, ___) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Food List"),
              elevation: 0,
            ),
            body: RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: () => _getData(),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: _viewModel!.listFood.length,
                separatorBuilder: (c, i) => const SizedBox(height: 4),
                itemBuilder: (context, index) {
                  final data = _viewModel!.listFood[index];

                  return ListTile(
                    dense: true,
                    title: Text(data.name!),
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FormFoodScreen(foodEntity: data),
                        ),
                      );
                      _refreshIndicatorKey.currentState!.show();
                      _getData();
                    },
                    trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                      Text(
                        AppFormatter.idrMoneyFormat(
                          value: int.tryParse(data.price!) ?? 0,
                          pattern: "Rp",
                        ),
                      ),
                      const Icon(Icons.chevron_right_rounded),
                    ]),
                    leading: CachedNetworkImage(
                      imageUrl: data.picture!,
                      fit: BoxFit.fitWidth,
                      maxWidthDiskCache: 70,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      width: 70,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  );
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FormFoodScreen(),
                  ),
                );
                _refreshIndicatorKey.currentState!.show();
                _getData();
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }

  _getData() async {
    final state = await _viewModel!.getFood();

    state.when(
      success: () {},
      clientError: () => _showMessage(AppConstants.clientError),
      serverError: () => _showMessage(AppConstants.serverError),
      networkError: () => _showMessage(AppConstants.networkError),
    );
  }

  _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
