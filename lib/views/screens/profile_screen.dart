import 'package:flutter/material.dart';

class DeliveryAddressScreen extends StatelessWidget {
  const DeliveryAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [

          Row(children: List.generate(3, (index) => InputChip(label: Text(""))),)
        ],),
      ),
    );
  }
}
