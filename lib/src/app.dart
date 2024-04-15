import 'package:flutter/material.dart';

import '../theme/theme_data.dart';
import 'components/menu_catalog.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    textController,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        home: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                centerTitle: true,
                title: const Text('Меню',
                    style: TextStyle(
                        color: Color.fromARGB(255, 245, 235, 220),
                        fontFamily: 'Flame',
                        fontSize: 16)),
                backgroundColor: const Color.fromARGB(255, 80, 35, 20),
              ),
              body: MenuCatalog()),
        ));
  }
}
