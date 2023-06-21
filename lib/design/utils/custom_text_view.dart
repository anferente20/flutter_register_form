import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:register_form/core/models/user.dart';
import 'package:register_form/design/screens/user_information_screen.dart';

class CustomTextView extends StatelessWidget {
  final String text;
  final Function() action;
  final bool showAction;

  const CustomTextView(
      {super.key,
      required this.text,
      required this.action,
      this.showAction = true});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 5),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: Text(text),
        ),
        Visibility(
            visible: showAction,
            child: GestureDetector(
              onTap: action,
              child: Text(
                AppLocalizations.of(context)!.more,
                style: const TextStyle(
                    color: Colors.redAccent,
                    decoration: TextDecoration.underline),
              ),
            ))
      ]),
      const SizedBox(height: 5),
      const Divider(thickness: 1, color: Colors.grey),
    ]);
  }
}
