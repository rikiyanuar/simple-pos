import 'package:flutter/material.dart';

import '../../../domain/entity/food_entity.dart';
import '../../../domain/use_case/app_usecases.dart';
import '../../../external/colors/app_colors.dart';
import '../../../external/constants/app_constant.dart';
import '../../../external/formatter/formatter.dart';
import '../../../external/libraries/libraries.dart';
import '../../view_model/order_view_model.dart';
import '../../widgets/charge_dialog.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with TickerProviderStateMixin {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  AnimationController? _controller;

  OrderViewModel? _viewModel;

  @override
  void initState() {
    _viewModel = OrderViewModel(
      useCase: GetIt.I.get<AppUseCase>(),
    );

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));

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
      child: Consumer<OrderViewModel>(
        builder: (_, __, ___) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Order"),
              elevation: 0,
            ),
            body: Column(children: [
              Expanded(
                child: RefreshIndicator(
                  key: _refreshIndicatorKey,
                  onRefresh: () => _getData(),
                  child: GridView.count(
                    childAspectRatio: 3 / 4,
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    padding: const EdgeInsets.all(16),
                    children: _viewModel!.listFood.map((data) {
                      return _buildGridTile(data);
                    }).toList(),
                  ),
                ),
              ),
              _viewModel!.selectedFood.isEmpty || _viewModel!.isLoading
                  ? const SizedBox.shrink()
                  : _buildCart(context),
            ]),
          );
        },
      ),
    );
  }

  Expandable _buildCart(BuildContext context) {
    return Expandable(
      initiallyExpanded: _viewModel!.isExpand,
      onPressed: () {
        _viewModel!.isExpand = !_viewModel!.isExpand;
      },
      borderRadius: BorderRadius.zero,
      firstChild: Stack(children: [
        _buildFirstChild(),
        Positioned(
          left: MediaQuery.of(context).size.width / 2 - 12,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: AppColors.purple1,
            ),
            child: Icon(
              _viewModel!.isExpand
                  ? Icons.keyboard_arrow_down_rounded
                  : Icons.keyboard_arrow_up_rounded,
              color: AppColors.white,
            ),
          ),
        ),
      ]),
      secondChild: Container(
        color: AppColors.white,
        child: _viewModel!.isLoading ? Container() : _buildSecondChild(),
      ),
      backgroundColor: Colors.transparent,
      showArrowWidget: false,
      clickable: Clickable.everywhere,
      boxShadow: const [],
      animationController: _controller,
    );
  }

  Widget _buildFirstChild() {
    return Column(children: [
      Container(height: 12, color: Colors.transparent),
      Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
        ),
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(
            top: BorderSide(color: AppColors.grey2, width: 1.5),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(children: [
          const Icon(Icons.shopping_basket_rounded, color: AppColors.black3),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              AppFormatter.idrMoneyFormat(
                value: _viewModel!.totalPayment,
                pattern: "Rp",
              ),
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => _showChargeDialog(),
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.purple1,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              height: 28,
              width: 70,
              alignment: Alignment.center,
              child: const Text(
                "Charge",
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ]),
      ),
    ]);
  }

  GestureDetector _buildGridTile(FoodEntity data) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _selectFood(data, 1),
      child: Material(
        elevation: 4,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
            color: AppColors.white,
            child: Column(children: [
              data.picture == null
                  ? const Icon(Icons.broken_image_rounded, size: 48)
                  : CachedNetworkImage(
                      imageUrl: data.picture!,
                      fit: BoxFit.fitWidth,
                      maxHeightDiskCache: 180,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
              const SizedBox(height: 4),
              Column(children: [
                Text(data.name!),
                Text(AppFormatter.idrMoneyFormat(
                  value: int.parse(data.price!),
                  pattern: "Rp",
                )),
              ]),
              const Spacer(),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.magenta1,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: 28,
                alignment: Alignment.center,
                width: double.infinity,
                child: const Text(
                  "Order",
                  style: TextStyle(color: AppColors.white),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  ListView _buildSecondChild() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: _viewModel!.selectedFood.length,
      separatorBuilder: (c, i) => const SizedBox(height: 4),
      itemBuilder: (context, index) {
        final data = _viewModel!.selectedFood[index];
        final dataFood = _viewModel!.listFood[
            _viewModel!.listFood.indexWhere((el) => el.id == data.id)];

        return ListTile(
          dense: true,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.name!),
              Text(
                "${AppFormatter.idrMoneyFormat(
                  value: data.price,
                  pattern: "Rp",
                )}/porsi",
              ),
            ],
          ),
          trailing: Row(mainAxisSize: MainAxisSize.min, children: [
            IconButton(
              onPressed: () => _selectFood(dataFood, -1),
              icon: const Icon(Icons.remove_circle_rounded),
            ),
            Text(data.qty.toString()),
            IconButton(
              onPressed: () => _selectFood(dataFood, 1),
              icon: const Icon(Icons.add_circle_rounded),
            ),
          ]),
          leading: CachedNetworkImage(
            imageUrl: data.picture!,
            fit: BoxFit.fitWidth,
            maxWidthDiskCache: 70,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            width: 70,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        );
      },
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

  _selectFood(FoodEntity food, int qty) async {
    if (_viewModel!.isExpand) {
      _controller!.forward();
    }
    final state = await _viewModel!.selectFood(food, qty);

    state.when(
      success: () {},
      clientError: () => _showMessage(AppConstants.clientError),
      serverError: () {},
      networkError: () {},
    );
  }

  _showChargeDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: ChargeDialog(
            selectedFood: _viewModel!.selectedFood,
            totalPayment: _viewModel!.totalPayment,
          ),
        );
      },
    );
  }
}
