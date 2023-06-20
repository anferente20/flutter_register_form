import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomBottomBar extends StatelessWidget {
  final Function(int) changeScreen;

  const CustomBottomBar({super.key, required this.changeScreen});

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      backgroundColor: Colors.redAccent,
      items: [
        TabItem(icon: Icons.add, title: AppLocalizations.of(context)!.add),
        TabItem(icon: Icons.people, title: AppLocalizations.of(context)!.users),
      ],
      onTap: (int i) => changeScreen(i),
    );
  }
}
