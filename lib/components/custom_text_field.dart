import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController textEC;
  final bool isPassword;
  final FormFieldValidator<String>? validator;

  const CustomTextField({
    super.key,
    this.labelText = '',
    this.hintText = '',
    required this.textEC,
    this.isPassword = false,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

ChangeNotifier customTextFieldListener = ChangeNotifier();

class _CustomTextFieldState extends State<CustomTextField> {
  bool hiddenButton = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
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
        ),
      ],
    );
  }
}
