import 'package:flutter/material.dart';

class ChoiceItem extends StatelessWidget {
  final String choice;
  final bool isSelected;
  final VoidCallback onTap;

  ChoiceItem({required this.choice, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.yellow : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        margin: const EdgeInsets.all(4.0),
        child: Text(choice, style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
