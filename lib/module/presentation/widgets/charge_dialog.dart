import 'package:flutter/material.dart';

import '../../domain/entity/selected_food_entity.dart';
import '../../external/colors/app_colors.dart';
import '../../external/formatter/formatter.dart';
import '../../external/libraries/libraries.dart';

class ChargeDialog extends StatefulWidget {
  final List<SelectedFoodEntity> selectedFood;
  final int totalPayment;

  const ChargeDialog({
    super.key,
    required this.selectedFood,
    required this.totalPayment,
  });

  @override
  State<ChargeDialog> createState() => _ChargeDialogState();
}

class _ChargeDialogState extends State<ChargeDialog> {
  TextEditingController controller = TextEditingController();
  int kembalian = 0;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Row(children: [
          const Expanded(
            child: Text(
              "Detail Pesanan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
          )
        ]),
      ),
      _buildList(),
      const SizedBox(height: 24),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(children: [
          const Expanded(child: Text("Total")),
          Text(AppFormatter.idrMoneyFormat(
            value: widget.totalPayment,
            pattern: "Rp",
          )),
        ]),
      ),
      const SizedBox(height: 8),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(children: [
          const Expanded(child: Text("Uang dibayar")),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                isDense: true,
                filled: true,
                fillColor: AppColors.grey3,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: AppColors.grey3),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: AppColors.grey3),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
              ),
              textAlign: TextAlign.end,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                int input = int.tryParse(value) ?? 0;
                int newValue = input - widget.totalPayment;
                setState(() {
                  kembalian = newValue < 0 ? 0 : newValue;
                });
              },
            ),
          ),
        ]),
      ),
      const SizedBox(height: 8),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(children: [
          const Expanded(child: Text("Kembalian")),
          Text(AppFormatter.idrMoneyFormat(
            value: kembalian,
            pattern: "Rp",
          )),
        ]),
      ),
      const SizedBox(height: 8),
      Container(
        decoration: const BoxDecoration(
          color: AppColors.magenta1,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        height: 32,
        alignment: Alignment.center,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: const Text(
          "Cetak Struk",
          style: TextStyle(color: AppColors.white),
        ),
      ),
      const SizedBox(height: 16)
    ]);
  }

  ListView _buildList() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: widget.selectedFood.length,
      separatorBuilder: (c, i) => const SizedBox(height: 4),
      itemBuilder: (context, index) {
        final data = widget.selectedFood[index];

        return ListTile(
          dense: true,
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
          trailing: Text(
            "x${data.qty}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
