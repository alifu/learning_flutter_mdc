import 'package:flutter/material.dart';
import 'package:nuarz_app/component/tiny_tab_indicator.dart';

class HomeTabBar extends TabBar {
  HomeTabBar({
    Key? key,
    required List<Widget> tabs,
    required Function(int) onTab,
    TinyTabIndicatorSize? indicatorSize,
    Color? indicatorColor,
    double? indicatorHeight,
    TextStyle? labelStyle,
    Color? unselectedLabelColor,
    TabController? controller,
  }) : super(
          key: key,
          tabs: tabs,
          onTap: onTab,
          labelStyle: labelStyle,
          unselectedLabelColor: unselectedLabelColor,
          labelPadding: EdgeInsets.only(left: 32.0,right: 32.0,bottom: 16.0),
          isScrollable: true,
          physics: BouncingScrollPhysics(),
          indicator: TinyTabIndicator(
            indicatorHeight: indicatorHeight ?? 6.0,
            indicatorColor: indicatorColor ?? Colors.lightBlue,
            indicatorSize: indicatorSize ?? TinyTabIndicatorSize.tiny,
          ),
          controller: controller,
        );
}
