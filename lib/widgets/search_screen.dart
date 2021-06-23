import 'package:flutter/material.dart';

import 'custom_search_delegate.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Search"),
          onPressed: () {
            showSearch(
                context: context,
                delegate: CustomSearchDelegate(persons: [
                  {"koko": Colors.red, "kokao": Colors.red}
                ]));
          },
        ),
      ),
    );
  }
}
