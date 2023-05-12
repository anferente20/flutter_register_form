import 'package:flutter/material.dart';

class AddUserScreen extends StatefulWidget {
  static const route = 'AddUserScreen';
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Add user screen'),
        ],
      ),
    );
  }
}
