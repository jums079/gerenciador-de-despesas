import 'package:gerenciador_de_despesas/view/home_page/shared/dialogs/dialog_add_expense.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../controller/home_page/home_page_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciador de Despesas'),
        actions: [
          IconButton.outlined(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => DialogAddExpense(),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),

      body: Obx(() {
        if (controller.expenses.isEmpty) {
          return const Center(child: Text('Nenhuma despesa adicionada'));
        }
        return ListView.builder(
          itemCount: controller.expenses.length,
          itemBuilder: (context, index) {
            final expense = controller.expenses[index];
            return ExpansionTile(
              title: Text(expense.name),
              subtitle: Text('R\$ ${expense.value.toStringAsFixed(2)}'),
              children: [
                Text('Responsável: ${expense.responsible}'),
                Text('Cartão: ${expense.card}'),
                Text('Parcelas: ${expense.parcels}'),
                Obx(
                  () => Row(
                    children: [
                      Text('Parcelas pagas:'),
                      IconButton(
                        onPressed: () {
                          controller.incrementPaidParcels(expense);
                        },
                        icon: Icon(Icons.add),
                      ),
                      Text('${expense.paidParcels}'),
                      IconButton(
                        onPressed: () {
                          controller.decrementPaidParcels(expense);
                        },
                        icon: Icon(Icons.remove),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      }),
    );
  }
}
