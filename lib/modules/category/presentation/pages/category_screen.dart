import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool isShowMoreBtns = false;

  late List<ItemModel> itemList;

  @override
  void initState() {
    itemList = [
      ItemModel(
          icon: Icons.tiktok,
          color: Colors.blue,
          title: "Top top",
          onTap: () {}),
      ItemModel(
          icon: Icons.tiktok,
          color: Colors.blue,
          title: "Top top",
          onTap: () {}),
      ItemModel(
          icon: Icons.tiktok,
          color: Colors.blue,
          title: "Top top",
          onTap: () {}),
      ItemModel(
          icon: Icons.tiktok,
          color: Colors.blue,
          title: "Top top",
          onTap: () {}),
      ItemModel(
          icon: Icons.tiktok,
          color: Colors.blue,
          title: "Top top",
          onTap: () {}),
      ItemModel(
          icon: Icons.tiktok,
          color: Colors.blue,
          title: "Top top",
          onTap: () {}),
      ItemModel(
          icon: Icons.tiktok,
          color: Colors.blue,
          title: "Top top",
          onTap: () {}),
      ItemModel(
        icon: Icons.more_horiz,
        color: Colors.grey,
        title: "More",
        onTap: () {
          setState(() {
            isShowMoreBtns = !isShowMoreBtns;
          });
        },
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBodyWidget,
    );
  }

  Widget get getBodyWidget {
    return SingleChildScrollView(
      child: Column(
        children: [
          getHeaderWidget,
          GridView.builder(
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.zero,
            itemCount: itemList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final item = itemList[index];
              return GestureDetector(
                onTap: item.onTap,
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: item.color,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Icon(
                          item.icon,
                          size: 40,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          if (isShowMoreBtns) getMoreBtnsWidget,
          Container(
            height: 10,
            color: Colors.black12,
          ),
          getNews,
        ],
      ),
    );
  }

  Widget get getHeaderWidget {
    final wScreen = MediaQuery.of(context).size.width;
    final appBarPadding = MediaQuery.of(context).viewPadding.top;
    return SizedBox(
      height: 360,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: 200,
              width: wScreen,
              padding: EdgeInsets.only(top: appBarPadding),
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText: "Search",
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Icon(
                        Icons.account_circle_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
          Positioned(
              top: 100,
              child: SizedBox(
                height: 260,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(
                              left: 20,
                              top: 10,
                              bottom: 10,
                            ),
                            height: 300,
                            width: wScreen - 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                )
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "Category $index",
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget get getMoreBtnsWidget {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      padding: EdgeInsets.zero,
      itemCount: 7,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final item = ItemModel(
          icon: Icons.access_time,
          color: Colors.green,
          title: "More btn",
          onTap: () {},
        );
        return Column(
          children: [
            Container(
              height: 60,
              width: 60,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: item.color,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Icon(
                  item.icon,
                  size: 40,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              item.title,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget get getNews {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "News",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "See more",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              separatorBuilder: (context, index) {
                return const SizedBox(width: 10);
              },
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "News $index",
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ItemModel {
  final IconData icon;
  final Color color;
  final String title;
  final VoidCallback onTap;

  ItemModel({
    required this.icon,
    required this.color,
    required this.title,
    required this.onTap,
  });
}
