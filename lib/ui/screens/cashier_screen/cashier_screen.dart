import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cashier_controller.dart';

class CashierScreen extends GetWidget<CashierController> {
  const CashierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Cashier page is yet to come",style: TextStyle(
        fontSize: 20.0,
      ),)),
    );
  }
}