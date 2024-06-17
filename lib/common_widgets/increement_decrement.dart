import 'package:flutter/material.dart';

class IncrementDecrementWidget extends StatefulWidget {
  const IncrementDecrementWidget({super.key});

  @override
  State<IncrementDecrementWidget> createState() =>
      _IncrementDecrementWidgetState();
}

class _IncrementDecrementWidgetState extends State<IncrementDecrementWidget> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
            onTap: () {
              if (value > 0) {
                setState(() {
                  value--;
                });
              }
            },
            child: const Icon(Icons.remove)),
        const SizedBox(
          width: 15,
        ),
        Text(
          "$value",
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          width: 15,
        ),
        InkWell(
            onTap: () {
              setState(() {
                value++;
              });
            },
            child: const Icon(Icons.add)),
      ],
    );
  }
}
