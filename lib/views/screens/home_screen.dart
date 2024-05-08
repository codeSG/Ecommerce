import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int activeIndex = 0;
  List bottomNavigationBar = [
    {
      "title": "Home",
      "icon": Icons.home,
    },
    {
      "title": "Library",
      "icon": Icons.library_add,
    },
    {
      "title": "Profile",
      "icon": Icons.person,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My BookShelf"),
        actions: const [Icon(Icons.notifications)],
      ),
      drawer: const Drawer(),
      bottomNavigationBar: BottomNavigationBar(
          items: List.generate(
              bottomNavigationBar.length,
              (index) => BottomNavigationBarItem(
                  label: bottomNavigationBar[index]["title"],
                  icon: Icon(bottomNavigationBar[index]["icon"])))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(),
            // PageView(
            //   controller: _pageController,
            //   onPageChanged: (value) {
            //     setState(() {
            //       activeIndex = value;
            //     });
            //   },
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  3,
                  (index) => InkWell(
                        onTap: () {
                          activeIndex = index;
                          _pageController.jumpToPage(index);
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: activeIndex == index
                                ? Theme.of(context).colorScheme.onBackground
                                : Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.4),
                          ),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
