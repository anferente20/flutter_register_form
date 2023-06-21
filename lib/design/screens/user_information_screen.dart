import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:register_form/core/models/user.dart';

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
                        child: Column(
                      children: [
                        makeField(
                            label: AppLocalizations.of(context)!.name,
                            controller:
                                TextEditingController(text: widget.user.name)),
                        makeField(
                            label: AppLocalizations.of(context)!.lastName,
                            controller: TextEditingController(
                                text: widget.user.lastName)),
                        makeField(
                            label: AppLocalizations.of(context)!.date,
                            controller: TextEditingController(
                                text: widget.user.birthDate.toString()))
                      ],
                    )),
                  ))
            ])));
  }

  Widget makeField(
      {required String label, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black87),
        ),
        const SizedBox(
          height: 5,
        ),
        // Note: Same code is applied for the TextFormField as well
        SizedBox(
            width: 200,
            child: TextField(
              controller: controller,
              readOnly: true,
              enabled: false,
              style: const TextStyle(color: Colors.black54),
              decoration: const InputDecoration(
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                ),
              ),
            )),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
