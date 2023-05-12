import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final Function(int) changeScreen;

  const CustomBottomBar({super.key, required this.changeScreen});

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      items: const [
        TabItem(icon: Icons.add, title: 'Agregar'),
        TabItem(icon: Icons.people, title: 'Usuarios'),
      ],
      onTap: (int i) => changeScreen(i),
    );
  }
}
