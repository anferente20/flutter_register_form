import 'package:flutter/material.dart';
import 'package:register_form/design/screens/add_user_screen.dart';
import 'package:register_form/design/screens/user_information_screen.dart';
import 'package:register_form/design/utils/bottom_bar.dart';

class MainPage extends StatefulWidget {
  static const route = 'MainPage';
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _counter = 0;
  int indexScreen = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _changeScreen(int index) {
    setState(() {
      indexScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(
        changeScreen: _changeScreen,
      ),
      body: getScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget getScreen() {
    switch (indexScreen) {
      case 0:
        return const AddUserScreen();
      case 1:
        return const UserInformationScreen();
      default:
        return const AddUserScreen();
    }
  }
}
