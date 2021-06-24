import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nuarz_app/component/home_tab_bar.dart';
import 'package:nuarz_app/component/tiny_tab_indicator.dart';
import 'package:nuarz_app/home/home_tabbar_navigator.dart';
import 'package:nuarz_app/home/ui_models.dart';
import 'package:nuarz_app/util/app_color.dart';
import 'package:nuarz_app/util/app_svg_icons.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin  {
  late List<TabItemUiModel> _tabs;
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _tabs = [
      TabItemUiModel("In Theater", 1),
      TabItemUiModel("Box Office", 2),
      TabItemUiModel("Coming Soon", 3),
    ];

    _controller = TabController(length: _tabs.length, vsync: this);
    _controller.index = 0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _selectTab(int index) {
    if (index == _controller.index) {
      _tabs[_controller.index]
          .navigatorKey
          .currentState
          ?.popUntil((route) => route.isFirst);
    } else {
      setState(() => _controller.index = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: _buildScaffold(),
      onWillPop: () async {
        final maybePop = await _tabs[_controller.index]
                .navigatorKey
                .currentState
                ?.maybePop() ??
            false;
        final isFirstRoute = !maybePop;
        if (isFirstRoute && _controller.index != 0) {
          _selectTab(0);
          return false;
        }
        return isFirstRoute;
      },
    );
  }

  Widget _buildScaffold() {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 128.0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leadingWidth: 72.0,
        leading: Row(
          children: [
            SizedBox(
              width: 18.0,
            ),
            IconButton(
              icon: SvgPicture.asset(
                AppSvgIcons.icon_menu,
                color: AppColors.iconPrimary,
              ),
              onPressed: () {},
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppSvgIcons.icon_search,
              color: AppColors.iconPrimary,
            ),
          ),
          SizedBox(
            width: 18.0,
          ),
        ],
        bottom: HomeTabBar(
          tabs: List.generate(
              _tabs.length, (index) => Tab(text: _tabs[index].label)),
          onTab: (index) => _selectTab(index),
          labelStyle: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 32.0,
              fontWeight: FontWeight.w500),
          indicatorSize: TinyTabIndicatorSize.tiny,
          indicatorColor: AppColors.tabIndicator,
          indicatorHeight: 6.0,
          unselectedLabelColor: AppColors.unselectedTabLabelColor,
          controller: _controller,
        ),
      ),
      backgroundColor: Colors.white,
      body: TabBarView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(
          _tabs.length,
          (index) => HomeTabBarNavigator(tabItem: _tabs[index]),
        ),
      ),
    );
  }
}