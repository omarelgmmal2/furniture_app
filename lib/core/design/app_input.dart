import 'package:flutter/material.dart';

class AppInput extends StatefulWidget {
  final TextEditingController? controller;
  final String labelText;
  final double paddingBottom, paddingTop;
  final bool isPassword;
  final bool isEmail;
  final FormFieldValidator<String?>? validator;

  const AppInput(
      {super.key,
      this.validator,
      this.controller,
      required this.labelText,
      this.paddingBottom = 16,
      this.paddingTop = 0,
      this.isPassword = false,
      this.isEmail = false});

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
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
          obscureText: isPasswordHidden && widget.isPassword,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.labelText,
            prefixIcon: widget.isEmail
                ? const Icon(
                    Icons.email_rounded,
                    color: Colors.black,
                  )
                : const Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      isPasswordHidden = !isPasswordHidden;
                      setState(() {});
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
