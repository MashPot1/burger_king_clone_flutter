import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'menu_item.dart';
import '../utils/fetch_menu.dart';

class MenuCatalog extends StatefulWidget {
  final Future menu = fetchMenu();

  MenuCatalog({super.key, textController});

  @override
  State<MenuCatalog> createState() => _MenuCatalogState();
}

class _MenuCatalogState extends State<MenuCatalog> {
  TextEditingController textController = TextEditingController();
  double scaleFactor = 1.0;
  double fontSize(BuildContext context, double size) {
    return size * MediaQuery.of(context).size.width / 375.0;
  }

  double imageSize(BuildContext context, double size) {
    return size * MediaQuery.of(context).size.width / 375.0;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.menu,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text(
                  'Что-то пошло не так, перезагрузите приложение');
            }
            if (snapshot.hasData) {
              List<Map<String, dynamic>> menuData = snapshot.data;

              return CustomScrollView(slivers: [
                SliverAppBar(
                  title: CupertinoSearchTextField(
                    controller: textController,
                    onChanged: (value) {
                      print(textController.text);
                    },
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 0,
                    ),
                    suffixIcon: textController.text.isEmpty
                        ? const Icon(CupertinoIcons.search)
                        : const Icon(Icons.cancel),
                    suffixMode: OverlayVisibilityMode.always,
                    onSuffixTap: () {
                      if (textController.text.isNotEmpty) {
                        textController.clear();
                      }
                    },
                    backgroundColor: Theme.of(context).colorScheme.background,
                    placeholder: 'Поиск по меню',
                    itemColor: const Color.fromARGB(255, 149, 138, 125),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 149, 138, 125),
                      fontFamily: 'Rotonda',
                    ),
                  ),
                  toolbarHeight: 46,
                  leadingWidth: double.infinity,
                  floating: true,
                  pinned: false,
                  backgroundColor: const Color.fromARGB(255, 80, 35, 20),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(8.0),
                  sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return MenuItem(menuData[index], fontSize, imageSize);
                      }, childCount: menuData.length),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              crossAxisCount: 2)),
                ),
              ]);
            }
          }
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        });
  }
}
