import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class CustomTextInput extends StatefulWidget {
  final String label;
  final TextInputType type;
  final bool isDate;
  final TextEditingController textController;
  final bool readOnly;
  final List<TextInputFormatter> formatters;

  const CustomTextInput(
      {super.key,
      required this.label,
      required this.textController,
      this.type = TextInputType.text,
      this.isDate = false,
      this.readOnly = false,
      required this.formatters});

  @override
  State<CustomTextInput> createState() => _CustomTextInputtState();
}

class _CustomTextInputtState extends State<CustomTextInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
            visible: widget.readOnly,
            child: Column(children: [
              Text(
                widget.label,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Colors.black87),
              ),
            ])),
        TextFormField(
          controller: widget.textController,
          inputFormatters: widget.formatters,
          onTap: widget.isDate
              ? () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: const ColorScheme.light(
                              primary: Colors.redAccent, // <-- SEE HERE
                              onSurface: Colors.redAccent, // <-- SEE HERE
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                foregroundColor:
                                    Colors.redAccent, // button text color
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      });

                  if (pickedDate != null) {
                    String formattedDate = DateFormat.yMd().format(pickedDate);
                    setState(() {
                      widget.textController.text = formattedDate;
                    });
                  }
                }
              : () {},
          decoration: widget.readOnly
              ? const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                  ),
                )
              : InputDecoration(
                  hintText: getHintText(widget.type),
                  labelText: widget.label,
                  floatingLabelStyle: const TextStyle(color: Colors.redAccent),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }

  String getHintText(TextInputType type) {
    if (type == TextInputType.datetime) {
      return 'dd-mm-yyyy';
    }
    if (type == TextInputType.streetAddress) {
      return 'Ej: Cll 67 # 14 -20';
    }
    if (type == TextInputType.name) {
      return 'Ej: Pablo';
    } else {
      return 'Ej: Cali';
    }
  }
}
