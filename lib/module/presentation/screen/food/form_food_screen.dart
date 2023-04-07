import 'package:flutter/material.dart';

import '../../../domain/entity/food_entity.dart';
import '../../../domain/use_case/app_usecases.dart';
import '../../../external/colors/app_colors.dart';
import '../../../external/constants/app_constant.dart';
import '../../../external/libraries/libraries.dart';
import '../../view_model/food_view_model.dart';

class FormFoodScreen extends StatefulWidget {
  final FoodEntity? foodEntity;

  const FormFoodScreen({super.key, this.foodEntity});

  @override
  State<FormFoodScreen> createState() => _FormFoodScreenState();
}

class _FormFoodScreenState extends State<FormFoodScreen> {
  FoodViewModel? _viewModel;

  @override
  void initState() {
    _viewModel = FoodViewModel(
      useCase: GetIt.I.get<AppUseCase>(),
      foodEntity: widget.foodEntity,
    );

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
              title: const Text("Form Food"),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(children: [
                  TextField(
                    controller: _viewModel!.foodCode,
                    decoration: const InputDecoration(label: Text("Food Code")),
                  ),
                  TextField(
                    controller: _viewModel!.name,
                    decoration: const InputDecoration(label: Text("Food Name")),
                  ),
                  TextField(
                    controller: _viewModel!.price,
                    decoration: const InputDecoration(
                      label: Text("Food Price"),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: _viewModel!.pictureUrl,
                    decoration: const InputDecoration(
                      label: Text("Food Picture URL"),
                    ),
                    keyboardType: TextInputType.url,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => _save(),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.purple1,
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      height: 48,
                      alignment: Alignment.center,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      child: const Text(
                        "SIMPAN",
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          );
        },
      ),
    );
  }

  _save() {
    if (widget.foodEntity == null) {
      _insert();
    } else {
      _update();
    }
  }

  _insert() async {
    final state = await _viewModel!.insertFood();

    state.when(
      success: () {
        _showMessage("Tambah data BERHASIL");
        Navigator.pop(context);
      },
      clientError: () => _showMessage(AppConstants.clientError),
      serverError: () => _showMessage(AppConstants.serverError),
      networkError: () => _showMessage(AppConstants.networkError),
    );
  }

  _update() async {
    final state = await _viewModel!.updateFood();

    state.when(
      success: () {
        _showMessage("Ubah data BERHASIL");
        Navigator.pop(context);
      },
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
