import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_form/core/bloc/user_bloc.dart';
import 'package:register_form/core/models/user.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:register_form/design/screens/user_information_screen.dart';

class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({super.key});

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 70),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(AppLocalizations.of(context)!.registeredUsers,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
                height: state.users.isEmpty
                    ? MediaQuery.of(context).size.height / 3
                    : 40),
            SingleChildScrollView(
                child: Column(children: [
              state.users.isEmpty
                  ? Center(child: Text(AppLocalizations.of(context)!.noUsers))
                  : const SizedBox(height: 10),
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
          Navigator.pushNamed(context, UserInformation.route,
              arguments: UserInformationArgs(user: user));
        },
      )
    ]),
    const SizedBox(height: 10),
    const Divider(thickness: 1, color: Colors.grey),
  ]);
}
