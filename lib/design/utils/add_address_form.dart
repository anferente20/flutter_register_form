import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:register_form/core/models/address.dart';
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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  CustomTextInput(
                      label: AppLocalizations.of(context)!.city,
                      textController: cityController),
                  CustomTextInput(
                      label: AppLocalizations.of(context)!.address,
                      textController: addressController),
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
                Address newAddress = Address(
                    address: addressController.text, city: cityController.text);
                widget.addAddress(newAddress);
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

  void CleanForm() {
    cityController.text = "";
    addressController.text = "";
  }
}
