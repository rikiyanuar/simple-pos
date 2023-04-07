import 'package:flutter/material.dart';

import '../../external/colors/app_colors.dart';
import 'food/food_screen.dart';
import 'order/order_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _navigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navigationIndex,
        unselectedItemColor: AppColors.grey1,
        selectedItemColor: AppColors.magenta1,
        unselectedFontSize: 10,
        selectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _navigationIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: "Order",
            icon: Icon(Icons.shopping_basket_rounded),
          ),
          BottomNavigationBarItem(
            label: "Food",
            icon: Icon(Icons.food_bank_rounded),
          ),
        ],
      ),
    );
  }

  _getBody() {
    switch (_navigationIndex) {
      case 1:
        return const FoodScreen();
      case 0:
      default:
        return const OrderScreen();
    }
  }
}
