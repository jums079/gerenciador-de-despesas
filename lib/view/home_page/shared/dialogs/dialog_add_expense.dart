import 'package:flutter/material.dart';
import 'package:gerenciador_de_despesas/controller/home_page/home_page_controller.dart';
import 'package:get/get.dart';

class DialogAddExpense extends StatelessWidget {
  DialogAddExpense({super.key});

  final controller = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomePageController>();
    return AlertDialog(
      title: const Text('Adicionar Despesa'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Nome',
                hintText: 'Burger King',
              ),
              controller: controller.nameController,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Valor',
                hintText: 'R\$ 0,00',
              ),
              keyboardType: TextInputType.number,
              controller: controller.valueController,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Responsável',
                hintText: 'João',
              ),
              controller: controller.responsibleController,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Cartão',
                hintText: 'Opcional',
              ),
              controller: controller.cardController,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Parcelas',
                hintText: 'Opcional',
              ),
              keyboardType: TextInputType.number,
              controller: controller.parcelController,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            controller.addExpense();
            Navigator.of(context).pop();
          },
          child: const Text('Adicionar'),
        ),
      ],
    );
  }
}
