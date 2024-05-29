import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final List<String> selectedChoices;

  Header({required this.selectedChoices});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[400],
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vos choix :',
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          if (selectedChoices.isEmpty)
            Text(
              'Cliquez sur les choix en dessous !',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          SizedBox(height: 10),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 8.0,
            runSpacing: 4.0,
            children: selectedChoices
                .map((choice) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Text(choice, style: TextStyle(color: Colors.black)),
              ),
            ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
