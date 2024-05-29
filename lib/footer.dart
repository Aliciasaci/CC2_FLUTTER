import 'package:flutter/material.dart';
import 'choice_item.dart';

class Footer extends StatelessWidget {
  final List<String> choices;
  final List<String> selectedChoices;
  final Function(String) onChoiceToggle;

  Footer({required this.choices, required this.selectedChoices, required this.onChoiceToggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 8.0,
            runSpacing: 4.0,
            children: choices.map((choice) {
              return ChoiceItem(
                choice: choice,
                isSelected: selectedChoices.contains(choice),
                onTap: () => onChoiceToggle(choice),
              );
            }).toList(),
          ),
      ),
    );
  }
}
