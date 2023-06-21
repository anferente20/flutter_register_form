import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_form/core/bloc/user_bloc.dart';
import 'package:register_form/core/models/user.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({super.key});

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 70),
        child: Column(
          children: [
            Text(AppLocalizations.of(context)!.registeredUsers,
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 50),
            SingleChildScrollView(
                child: Column(children: [
              for (final user in state.users) ...{printUser(user, context)}
            ]))
          ],
        ),
      );
    });
  }
}

Widget printUser(User user, BuildContext context) {
  return Column(children: [
    const SizedBox(height: 10),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text("${user.lastName.toUpperCase()}, ${user.name}"),
      GestureDetector(
        child: Text(
          AppLocalizations.of(context)!.more,
          style: const TextStyle(
              color: Colors.redAccent, decoration: TextDecoration.underline),
        ),
        onTap: () {
          print(user.name);
        },
      )
    ]),
    const SizedBox(height: 10),
    const Divider(thickness: 1, color: Colors.grey),
  ]);
}
