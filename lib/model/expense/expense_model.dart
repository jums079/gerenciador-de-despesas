import 'package:get/get.dart';

class Expense {
  final String name;
  final double value;
  final String responsible;
  final int parcels;
  RxInt paidParcels = 0.obs;

  Expense(this.name, this.value, this.responsible, this.parcels);
}
