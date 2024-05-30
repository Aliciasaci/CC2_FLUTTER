import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'tag_detail.dart';
import '../models/tag.dart';

class Header extends StatefulWidget {
  final List<Tag> selectedChoices;

  Header({required this.selectedChoices});

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  Color headerColor = Colors.deepPurple[400]!;

  void pickColor(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sélectionnez une couleur pour le header'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: headerColor,
              onColorChanged: (Color color) {
                setState(() {
                  headerColor = color;
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

  void navigateToTagDetails(BuildContext context, Tag tag) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TagDetails(
          title: tag.title,
          description: tag.description,
          category : tag.category,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: headerColor,
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Vos choix :',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Spacer(),
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
          if (widget.selectedChoices.isEmpty)
            Text(
              'Cliquez sur les choix en dessous !',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 8.0,
                runSpacing: 4.0,
                children: widget.selectedChoices.map((tag) {
                  return GestureDetector(
                    onTap: () => navigateToTagDetails(context, tag),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                        child: Text(tag.title, style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
