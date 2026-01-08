import 'package:flutter/cupertino.dart';
import 'package:gerenciador_de_despesas/model/expense/expense_model.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController valueController = TextEditingController();
  TextEditingController responsibleController = TextEditingController();
  TextEditingController cardController = TextEditingController();
  TextEditingController parcelController = TextEditingController();

  final RxList<Expense> expenses = <Expense>[].obs;

  @override
  void onClose() {
    nameController.dispose();
    valueController.dispose();
    responsibleController.dispose();
    cardController.dispose();
    parcelController.dispose();
    super.onClose();
  }

  void addExpense() {
    final name = nameController.text.trim();
    final responsible = responsibleController.text.trim();
    final card = cardController.text.trim();

    final valueText = valueController.text.trim().replaceAll(',', '.');
    final value = double.tryParse(valueText);

    final parcelsText = parcelController.text.trim();
    final parcels = int.tryParse(parcelsText) ?? 1;

    if (name.isEmpty || value == null || value <= 0) {
      return;
    }

    expenses.add(
      Expense(name, value, responsible, card, parcels < 1 ? 1 : parcels),
    );
  }
}
