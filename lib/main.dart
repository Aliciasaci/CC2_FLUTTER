import 'package:flutter/material.dart';
import './components/header.dart';
import './components/footer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Choix App',
      home: ChoixScreen(),
    );
  }
}

class ChoixScreen extends StatefulWidget {
  @override
  _ChoixScreenState createState() => _ChoixScreenState();
}

class _ChoixScreenState extends State<ChoixScreen> {
  List<String> selectedChoices = [];

  void toggleChoice(String choice) {
    setState(() {
      if (selectedChoices.contains(choice)) {
        selectedChoices.remove(choice);
      } else {
        selectedChoices.add(choice);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Générer 40 tags
    List<String> tags = List.generate(40, (index) => 'tag-${index + 1}');

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Header(selectedChoices: selectedChoices),
            ),
            Expanded(
              flex: 1,
              child: Footer(
                choices: [
                  'cinema',
                  'petanque',
                  'fitness',
                  'League Of Legend',
                  'basket',
                  'shopping',
                  'programmation',
                  ...tags,
                ],
                selectedChoices: selectedChoices,
                onChoiceToggle: toggleChoice,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
