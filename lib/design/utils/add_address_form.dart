import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:register_form/core/models/address.dart';
import 'package:register_form/core/validators/text_validator.dart';
import 'package:register_form/design/utils/custom_text_input.dart';

class AddAddressForm extends StatefulWidget {
  static const route = 'AddAddressForm';
  final Function(Address) addAddress;
  const AddAddressForm({super.key, required this.addAddress});

  @override
  State<AddAddressForm> createState() => _AddAddressFormState();
}

class _AddAddressFormState extends State<AddAddressForm> {
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool showErrorMessage = false;
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Visibility(
                visible: showErrorMessage,
                child: Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.redAccent, fontSize: 15),
                )),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  CustomTextInput(
                      label: AppLocalizations.of(context)!.city,
                      formatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp("[a-zA-Z\u00C0-\u024F\u1E00-\u1EFF]"))
                      ],
                      textController: cityController),
                  CustomTextInput(
                      label: AppLocalizations.of(context)!.address,
                      formatters: [],
                      textController: addressController,
                      type: TextInputType.streetAddress),
                  const SizedBox(height: 10)
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
              minWidth: 100,
              height: 60,
              onPressed: () {
                if (!TextValidator().isTextValid(cityController.text)) {
                  setState(() {
                    showErrorMessage = true;
                    errorMessage = AppLocalizations.of(context)!.checkForm;
                  });
                }
                if (!TextValidator().isAddressValid(addressController.text)) {
                  setState(() {
                    showErrorMessage = true;
                    errorMessage = AppLocalizations.of(context)!.checkAddress;
                  });
                } else {
                  Address newAddress = Address(
                      address: addressController.text,
                      city: cityController.text);
                  widget.addAddress(newAddress);
                }
              },
              color: Colors.redAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              child: Text(
                AppLocalizations.of(context)!.add,
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
    );
  }

  void cleanForm() {
    setState(() {
      cityController.text = "";
      addressController.text = "";
      showErrorMessage = false;
      errorMessage = "";
    });
  }

  bool isBtnEnabled() {
    return cityController.text.isNotEmpty && addressController.text.isNotEmpty;
  }
}
