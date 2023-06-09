import 'package:flutter/material.dart';
import '../home/home_page.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleAppBar({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  Size get preferredSize => const Size.fromHeight(120);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyan, Colors.amber],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (c) => const HomeScreen()),
          );
        },
      ),
      centerTitle: true,
      title: Text(
        title!,
        style: const TextStyle(
          fontSize: 20.0,
          letterSpacing: 3,
          color: Colors.white,
        ),
      ),
    );
  }
}
