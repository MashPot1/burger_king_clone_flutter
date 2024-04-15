import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  final Map<String, dynamic> menuData;
  final double Function(BuildContext context, double size) fontSize;
  final double Function(BuildContext context, double size) imageSize;

  const MenuItem(this.menuData, this.fontSize, this.imageSize, {super.key});

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  double scaleFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          scaleFactor = 0.9;
        });
      },
      onTapUp: (details) {
        setState(() {
          scaleFactor = 1;
        });
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Выберите вариант:'),
                  GestureDetector(
                    onTap: () {
                      // Логика для выбора только этого бургера
                    },
                    onSecondaryTap: () {},
                    child: const Text('Только этот бургер'),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Логика для выбора стандартного комбо
                    },
                    onSecondaryTap: () {},
                    child: const Text('Стандартное комбо'),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Логика для выбора большого комбо
                    },
                    onSecondaryTap: () {},
                    child: const Text('Большое комбо'),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Логика для выбора самого большого комбо
                    },
                    onSecondaryTap: () {},
                    child: const Text('Самое большое комбо'),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        transform: Matrix4.identity()..scale(scaleFactor),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: widget.imageSize(context, 66.0),
                  width: widget.imageSize(context, 66.0),
                  child: widget.menuData['image'] != null &&
                          widget.menuData['image']['name'] != null
                      ? Image(
                          image: NetworkImage(
                              'https://orderapp-static.burgerkingrus.ru/x256/mobile_image/${widget.menuData['image']['name']}.webp'),
                          fit: BoxFit.cover,
                        )
                      : const Placeholder(),
                ),
                Text(widget.menuData['name'],
                    style: TextStyle(
                        fontSize: widget.fontSize(context, 12.0),
                        fontFamily: 'Flame'),
                    softWrap: true,
                    overflow: TextOverflow.values.last,
                    textAlign: TextAlign.center),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${widget.menuData['price']} ₽',
                            style: TextStyle(
                                fontSize: widget.fontSize(context, 12.0),
                                fontFamily: 'Flame')),
                        Text('${widget.menuData['weight']} г',
                            style: TextStyle(
                              fontSize: widget.fontSize(context, 12.0),
                              fontFamily: 'Rotonda',
                              color:
                                  Theme.of(context).textTheme.bodyLarge!.color,
                            )),
                      ],
                    ),
                    const Icon(Icons.add),
                  ],
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
