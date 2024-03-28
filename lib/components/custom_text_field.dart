import 'package:enjoyce/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool isPasswordField;
  final bool isConfirmPasswordField;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function onChanged;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.isPasswordField,
    required this.isConfirmPasswordField,
    required this.controller,
    required this.validator,
    required this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  IconData iconVisibleOn = Icons.visibility_outlined;
  IconData iconVisibleOff = Icons.visibility_off_outlined;
  IconData? suffixIcon;
  bool fieldVisible = false;

  void toggleVisibility() {
    setState(() {
      if (widget.isPasswordField) {
        fieldVisible = !fieldVisible;
        suffixIcon = fieldVisible ? iconVisibleOn : iconVisibleOff;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    suffixIcon = (widget.isPasswordField && !widget.isConfirmPasswordField)
        ? iconVisibleOff
        : null;
    fieldVisible = widget.isPasswordField ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    var visibilityState = context.watch<VisibilityState?>();
    if (widget.isConfirmPasswordField && visibilityState != null) {
      fieldVisible = visibilityState.visibility;
    }

    return SizedBox(
      width: 380,
      child: TextFormField(
        controller: widget.controller,
        obscureText: !fieldVisible,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(suffixIcon),
            onPressed: () {
              toggleVisibility();
              if (visibilityState != null) {
                visibilityState.toggleVisibility();
              }
            },
          ),
          label: Text(widget.label),
          hintText: widget.hintText,
          hintStyle:
              const TextStyle(fontFamily: "Kanit", fontWeight: FontWeight.w300),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(43, 153, 216, 1),
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(43, 153, 216, 1),
              width: 3,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(204, 0, 1, 1),
              width: 3,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(204, 0, 1, 1),
              width: 3,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
        ),
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (value) {
          widget.onChanged();
        },
      ),
    );
  }
}
