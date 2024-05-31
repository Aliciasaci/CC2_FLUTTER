import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'choice_item.dart';
import 'core/models/tag.dart';

class Footer extends StatefulWidget {
  final List<Tag> choices;
  final List<Tag> selectedChoices;
  final Function(Tag) onChoiceToggle;

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
            child: ColorPicker(
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
                ElevatedButton(
                  onPressed: () => pickColor(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  child: Icon(
                    Icons.color_lens,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 8.0,
              runSpacing: 4.0,
              children: widget.choices.map((tag) {
                return ChoiceItem(
                  choice: tag.title,
                  isSelected: widget.selectedChoices.contains(tag),
                  onTap: () => widget.onChoiceToggle(tag),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
