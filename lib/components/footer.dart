import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'choice_item.dart';

class Footer extends StatefulWidget {
  final List<String> choices;
  final List<String> selectedChoices;
  final Function(String) onChoiceToggle;

  Footer({required this.choices, required this.selectedChoices, required this.onChoiceToggle});

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  Color footerColor = Colors.white;

  void pickColor(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sélectionnez une couleur pour le footer'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: footerColor,
              onColorChanged: (Color color) {
                setState(() {
                  footerColor = color;
                });
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Fermer'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: footerColor,
      width: double.infinity,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.color_lens, color: Colors.white),
                  onPressed: () => pickColor(context),
                ),
              ],
            ),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 8.0,
              runSpacing: 4.0,
              children: widget.choices.map((choice) {
                return ChoiceItem(
                  choice: choice,
                  isSelected: widget.selectedChoices.contains(choice),
                  onTap: () => widget.onChoiceToggle(choice),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
