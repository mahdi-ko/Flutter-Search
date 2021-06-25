import 'package:flutter/material.dart';

import 'custom_search_delegate.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final persons = [
    {"image": "airplane.png", "name": "Sami kali", "nickname": "The person"},
    {"image": "arctichare.png", "name": "Ali mazen", "nickname": "The owl"},
    {"image": "baboon.png", "name": "Sara lawski", "nickname": "Random guy"},
    {"image": "boat.png", "name": "Mira lawyer", "nickname": "Bugs killer"},
    {"image": "peppers.png", "name": "Moji zakara", "nickname": "Emerald"},
    {"image": "arctichare.png", "name": "Mohammad", "nickname": "Ruby"},
    {"image": "frymire.png", "name": "Adham", "nickname": "Diamond"},
  ];

  final List<Map<String, String>> personsToAddToList = [];
  final String imageSrc = "https://homepages.cae.wisc.edu/~ece533/images/";

  @override
  Widget build(BuildContext context) {
    final TextEditingController textFieldController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textFieldController,
                onSubmitted: (value) {
                  showMySearch(context, textFieldController.text);
                },
                decoration: InputDecoration(
                  isDense: true,
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(50.0),
                    ),
                  ),
                  prefixIcon: GestureDetector(
                    onTap: () async {
                      await showMySearch(context, textFieldController.text);

                      setState(() {});
                    },
                    child: Icon(
                      Icons.search,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: personsToAddToList.length,
                itemBuilder: (context, index) {
                  final person = personsToAddToList[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(imageSrc + person["image"]!),
                    ),
                    title: Text(person["name"]!),
                    subtitle: Text(person["nickname"]!),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> showMySearch(BuildContext context, String query) async {
    final Map<String, String> foundPerson = await showSearch(
        context: context, delegate: CustomSearchDelegate(persons: persons), query: query);
    setState(() {
      personsToAddToList.add(foundPerson);
    });
  }
}
