import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController textEC;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.hintText,
    required this.textEC,
    this.isPassword = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool nullText = false;
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
          onChanged: (value) {
            bool old = nullText;
            nullText = value.isEmpty ? true : false;
            if (old != nullText) setState(() {});
          },
        ),
        if (nullText)
          Text(
            "${widget.labelText} không thể để trống.",
            style: const TextStyle(color: Colors.red),
          ),
      ],
    );
  }
}
