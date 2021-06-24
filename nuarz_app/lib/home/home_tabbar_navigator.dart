import 'package:flutter/material.dart';
import 'package:nuarz_app/home/in_theater_page.dart';
import 'package:nuarz_app/home/tab_todo_page.dart';
import 'package:nuarz_app/home/ui_models.dart';

class HomeTabBarNavigator extends StatelessWidget {
  HomeTabBarNavigator({
    Key? key,
    required this.tabItem,
  });

  final TabItemUiModel tabItem;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: tabItem.navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (setting) {
        return MaterialPageRoute(builder: (context) {
          switch (tabItem.id) {
            case 3:
            case 2:
              return TabTodoPage(
                title: tabItem.label,
              );
            case 1:
            default:
              return InTheaterPage();
          }
        });
      },
    );
  }
}
