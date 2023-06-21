import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:register_form/core/bloc/user_bloc.dart';
import 'package:register_form/core/models/address.dart';
import 'package:register_form/core/models/user.dart';
import 'package:register_form/core/validators/text_validator.dart';
import 'package:register_form/design/utils/add_address_form.dart';
import 'package:register_form/design/utils/custom_text_input.dart';
import 'package:register_form/design/utils/custom_text_view.dart';

class AddUserScreen extends StatefulWidget {
  static const route = 'AddUserScreen';
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  List<Address> adresses = [];
  bool showAddressForm = false;
  bool showErrorMessage = false;
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset('assets/images/register.png',
                    height: MediaQuery.of(context).size.height * 0.3),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.registerUser,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Visibility(
                        visible: showErrorMessage,
                        child: Text(
                          errorMessage,
                          style: const TextStyle(
                              color: Colors.redAccent, fontSize: 15),
                        )),
                    const SizedBox(height: 5),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      CustomTextInput(
                          label: AppLocalizations.of(context)!.name,
                          formatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp("[a-zA-Z\u00C0-\u024F\u1E00-\u1EFF]"))
                          ],
                          type: TextInputType.name,
                          textController: nameController),
                      CustomTextInput(
                          label: AppLocalizations.of(context)!.lastName,
                          formatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp("[a-zA-Z\u00C0-\u024F\u1E00-\u1EFF]"))
                          ],
                          type: TextInputType.name,
                          textController: lastController),
                      CustomTextInput(
                          label: AppLocalizations.of(context)!.date,
                          formatters: [
                            FilteringTextInputFormatter.allow(RegExp("[0-9/]")),
                            LengthLimitingTextInputFormatter(10),
                          ],
                          type: TextInputType.datetime,
                          textController: dateController,
                          isDate: true),
                      const SizedBox(height: 20),
                      Text(
                        AppLocalizations.of(context)!.addresses,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87),
                      ),
                      const SizedBox(height: 10),
                      for (final address in adresses) ...{
                        CustomTextView(
                          text: "${address.address}, ${address.city}",
                          action: () {},
                          showAction: false,
                        )
                      },
                      Visibility(
                          visible: showAddressForm,
                          child: AddAddressForm(
                            addAddress: (address) {
                              setState(() {
                                adresses.add(address);
                                showAddressForm = false;
                              });
                            },
                          )),
                      const SizedBox(height: 5),
                      Container(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 4),
                        child: GestureDetector(
                          child: Row(children: [
                            Icon(
                                showAddressForm
                                    ? Icons.cancel_outlined
                                    : Icons.add_circle_outline_outlined,
                                size: 30,
                                weight: 10),
                            Text(showAddressForm
                                ? AppLocalizations.of(context)!.cancel
                                : AppLocalizations.of(context)!.addAddress)
                          ]),
                          onTap: () {
                            setState(() {
                              showAddressForm = !showAddressForm;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                padding: const EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: const Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black))),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    if (!TextValidator().isTextValid(nameController.text) ||
                        !TextValidator().isTextValid(lastController.text) ||
                        !TextValidator().isDateValid(dateController.text)) {
                      setState(() {
                        showErrorMessage = true;
                        errorMessage = AppLocalizations.of(context)!.checkForm;
                      });
                    } else {
                      User user = User(
                          addresses: adresses,
                          name: nameController.text,
                          lastName: lastController.text,
                          birthDate: DateFormat("dd/MM/yyyy")
                              .parse(dateController.text));

                      context.read<UserBloc>().add(AddUser(user: user));

                      cleanForm();
                    }
                  },
                  color: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    AppLocalizations.of(context)!.register,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void cleanForm() {
    setState(() {
      nameController.text = "";
      lastController.text = "";
      dateController.text = "";
      adresses = [];
      showErrorMessage = false;
      errorMessage = "";
    });
  }
}
