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
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nome da divida',
                  hintText: 'Burger King',
                ),
                controller: controller.nameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Valor',
                  hintText: 'R\$ 0,00',
                ),
                keyboardType: TextInputType.number,
                controller: controller.valueController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Responsável',
                  hintText: 'João',
                ),
                controller: controller.responsibleController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),

              Obx(() {
                return DropdownButton<String>(
                  hint: const Text('Selecione o pagamento'),
                  isExpanded: true,
                  value: controller.selectedPayment.value,
                  items: const ['Crédito', 'Débito', 'Pix', 'Boleto']
                      .map(
                        (value) =>
                            DropdownMenuItem(value: value, child: Text(value)),
                      )
                      .toList(),
                  onChanged: (value) =>
                      controller.selectedPayment.value = value,
                );
              }),

              Obx(() {
                if (controller.selectedPayment.value != 'Crédito') {
                  return const SizedBox.shrink();
                }
                return TextField(
                  decoration: const InputDecoration(
                    labelText: 'Parcelas',
                    hintText: 'Opcional',
                  ),
                  keyboardType: TextInputType.number,
                  controller: controller.parcelController,
                );
              }),
            ],
          ),
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
            if (controller.formKey.currentState!.validate()) {
              controller.addExpense();
              Navigator.of(context).pop();
            }
          },
          child: const Text('Adicionar'),
        ),
      ],
    );
  }
}
