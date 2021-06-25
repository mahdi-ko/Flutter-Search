import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<Map<String, String>> persons;
  final String imageSrc = "https://homepages.cae.wisc.edu/~ece533/images/";
  CustomSearchDelegate({required this.persons});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final foundPersons = persons.where((person) {
      return person["name"]!.toLowerCase().contains(query.toLowerCase()) ||
              person["nickname"]!.toLowerCase().contains(query.toLowerCase())
          ? true
          : false;
    }).toList();
    return ListView.builder(
        itemCount: foundPersons.length,
        itemBuilder: (context, index) {
          final person = foundPersons[index];
          return ListTile(
            onTap: () {
              query = person["name"]!;
              Future.delayed(Duration(milliseconds: 200)).then((_) {
                close(context, person);
              });
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(imageSrc + person["image"]!),
            ),
            title: Text(person["name"]!),
            subtitle: Text(person["nickname"]!),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final foundPersons = persons.where((person) {
      return person["name"]!.toLowerCase().contains(query.toLowerCase()) ||
              person["nickname"]!.toLowerCase().contains(query.toLowerCase())
          ? true
          : false;
    }).toList();
    return ListView.builder(
        itemCount: foundPersons.length,
        itemBuilder: (context, index) {
          final person = foundPersons[index];
          return ListTile(
            onTap: () {
              query = person["name"]!;
              Future.delayed(Duration(milliseconds: 200)).then((_) {
                close(context, person);
              });
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(imageSrc + person["image"]!),
            ),
            title: Text(person["name"]!),
            subtitle: Text(person["nickname"]!),
          );
        });
  }
}
