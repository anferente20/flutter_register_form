import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:register_form/core/models/user.dart';
import 'package:register_form/design/utils/custom_text_input.dart';
import 'package:register_form/design/utils/custom_text_view.dart';

class UserInformationArgs {
  const UserInformationArgs({required this.user});

  final User user;

  @override
  String toString() => 'UserInformationArgs(user: $user)';
}

class UserInformation extends StatefulWidget {
  static const route = 'UserInformation';
  final User user;
  const UserInformation({super.key, required this.user});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  int indexScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.only(top: 50),
            height: MediaQuery.of(context).size.height,
            child: Stack(children: [
              Image.asset('assets/images/about.png',
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width),
              Positioned(
                  left: 20,
                  top: 20,
                  child: GestureDetector(
                    child: const Icon(Icons.arrow_back_ios,
                        color: Colors.redAccent, size: 30, weight: 10),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.4,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            CustomTextInput(
                              label: AppLocalizations.of(context)!.name,
                              formatters: [],
                              textController:
                                  TextEditingController(text: widget.user.name),
                              readOnly: true,
                            ),
                            CustomTextInput(
                                label: AppLocalizations.of(context)!.lastName,
                                formatters: [],
                                textController: TextEditingController(
                                    text: widget.user.lastName),
                                readOnly: true),
                            CustomTextInput(
                                label: AppLocalizations.of(context)!.date,
                                formatters: [],
                                textController: TextEditingController(
                                    text: DateFormat("dd/MM/yyyy")
                                        .format(widget.user.birthDate)),
                                readOnly: true),
                            const SizedBox(height: 20),
                            Text(
                              AppLocalizations.of(context)!.addresses,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87),
                            ),
                            const SizedBox(height: 10),
                            for (final address in widget.user.addresses) ...{
                              CustomTextView(
                                text: "${address.address}, ${address.city}",
                                action: () {},
                                showAction: false,
                              )
                            },
                          ],
                        )),
                  ))
            ])));
  }
}
