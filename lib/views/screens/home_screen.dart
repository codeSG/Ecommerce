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
  final List _bannerImage = [Colors.amber, Colors.blue, Colors.red];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            TextFormField(
              decoration: const InputDecoration(),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: PageView(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    activeIndex = value;
                  });
                },
                children: List.generate(
                    _bannerImage.length,
                    (index) => Container(
                          height: 200,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: _bannerImage[index],
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(index.toString()),
                        )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  _bannerImage.length,
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
            ),
            SizedBox(
              height: size.height * 0.44,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    crossAxisCount: 3,
                    childAspectRatio: 0.7),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 4),
                      //width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 4),
                      decoration: ShapeDecoration(
                        color: Theme.of(context).colorScheme.tertiary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              "assets/shoes.jpeg",
                              height: size.width * 0.26,
                              width: size.width * 0.26,
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Product Name",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    Text(
                                      "2.99",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
