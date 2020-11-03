import 'package:flutter/material.dart';

class FoodCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FlatButton(
          child: Text('Go back'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
