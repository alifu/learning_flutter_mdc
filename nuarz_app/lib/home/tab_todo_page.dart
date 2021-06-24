import 'package:flutter/material.dart';
import 'package:nuarz_app/util/app_color.dart';

class TabTodoPage extends StatelessWidget {
  TabTodoPage({Key? key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
