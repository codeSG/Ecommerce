import 'package:flutter/material.dart';

class DeliveryAddressScreen extends StatefulWidget {
  const DeliveryAddressScreen({super.key});

  @override
  State<DeliveryAddressScreen> createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  List myAddressType = ["Home", "Work", "Hostel"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Select Address Type"),
            Row(
              children: List.generate(
                  3,
                  (index) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: InputChip(
                          selectedColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          onSelected: (value) => setState(() {
                                selectedIndex = index;
                              }),
                          disabledColor: Colors.white,
                          selected: selectedIndex == index,
                          padding: const EdgeInsets.all(8),
                          label: Text(
                            myAddressType[index],
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          )))),
            )
          ],
        ),
      ),
    );
  }
}
