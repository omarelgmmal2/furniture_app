import 'package:flutter/material.dart';

class AppInput2 extends StatefulWidget {
  final TextEditingController? controller;
  final String labelText;
  final double paddingBottom, paddingTop;
  final bool isPhoneNumber;
  final bool isPerson;
  final FormFieldValidator<String?>? validator;

  const AppInput2(
      {super.key,
        this.validator,
        this.controller,
        required this.labelText,
        this.paddingBottom = 16,
        this.paddingTop = 0,
        this.isPhoneNumber = false,
        this.isPerson = false});

  @override
  State<AppInput2> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput2> {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: widget.paddingBottom,
        top: widget.paddingTop,
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(left: 20, right: 15, top: 7),
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(45),
            bottomLeft: Radius.circular(45),
          ),
          border: Border.all(
            color: Colors.indigo,
            width: 1.5,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFE7EEF8),
              blurRadius: 1.0,
              offset: Offset(2.6, 2.6),
            ),
          ],
        ),
        child: TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.labelText,
            prefixIcon: widget.isPerson
                ? const Icon(
              Icons.person,
              color: Colors.black,
            )
                : const Icon(
              Icons.phone,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
