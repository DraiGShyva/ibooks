import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.textEC,
    this.labelText = '',
    this.hintText = '',
    this.isPassword = false,
    this.validator,
    this.action,
    this.focusNode,
    this.enabled = true,
    this.onFieldSubmitted,
  });

  final TextEditingController textEC;
  final String labelText;
  final String hintText;
  final bool isPassword;
  final FormFieldValidator<String>? validator;
  final TextInputAction? action;
  final FocusNode? focusNode;
  final bool enabled;
  final void Function(String)? onFieldSubmitted;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

ChangeNotifier customTextFieldListener = ChangeNotifier();

class _CustomTextFieldState extends State<CustomTextField> {
  bool hiddenButton = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.black, width: 1),
        ),
        labelText: widget.labelText,
        hintText: widget.hintText,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    hiddenButton = !hiddenButton;
                  });
                },
                icon: Icon(
                  hiddenButton ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
      ),
      controller: widget.textEC,
      obscureText: widget.isPassword ? hiddenButton : false,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: widget.action,
      focusNode: widget.focusNode,
      enabled: widget.enabled,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}
