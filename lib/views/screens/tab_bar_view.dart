import 'package:flutter/material.dart';

import '../../common_widgets/increement_decrement.dart';

List<String> tabsBarList = ["Clothes", "Electronics", "Makeups", "Groceries"];

class MyTabBarView extends StatefulWidget {
  const MyTabBarView({super.key});

  @override
  State<MyTabBarView> createState() => _MyTabBarViewState();
}

class _MyTabBarViewState extends State<MyTabBarView> {
  int activeTabBar = 0;
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabsBarList.length,
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TabBar(
                onTap: (value) => setState(() => activeTabBar = value),
                tabs: List.generate(tabsBarList.length,
                    (index) => Tab(text: tabsBarList[index]))),
            Expanded(
              child: TabBarView(
                  children: List.generate(
                      tabsBarList.length,
                      (index) =>
                          const Center(child: IncrementDecrementWidget()))),
            )
          ],
        ),
      ),
    );
  }
}
