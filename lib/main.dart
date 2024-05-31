import 'package:flutter/material.dart';
import 'core/services/api_services.dart';
import 'core/models/tag.dart';
import 'header.dart';
import 'footer.dart';

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
  List<Tag> selectedChoices = [];
  late Future<List<Tag>> futureTags;

  @override
  void initState() {
    super.initState();
    futureTags = ApiService().fetchData();
  }

  void flipChoice(Tag choice) {
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
              child: FutureBuilder<List<Tag>>(
                future: futureTags,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No tags found'));
                  } else {
                    List<Tag> tags = snapshot.data!;
                    return Footer(
                      choices: tags,
                      selectedChoices: selectedChoices,
                      onChoiceFlip: flipChoice,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
