import 'package:flutter/material.dart';
import 'tag_detail.dart';
import 'core/models/tag.dart';
import 'color_picker.dart';

class Header extends StatefulWidget {
  final List<Tag> selectedChoices;

  Header({required this.selectedChoices});

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  Color headerColor = Colors.deepPurple[400]!;

  void navigateToTagDetails(BuildContext context, Tag tag) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TagDetails(
          title: tag.title,
          description: tag.description,
          category : tag.category,
          price : tag.price,
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
                onPressed: () => pickColor(context, headerColor, (color) {
                  setState(() {
                    headerColor = color;
                  });
                }),
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
