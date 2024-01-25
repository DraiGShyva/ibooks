import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final String hintText;
  final TextEditingController? textEC;
  final bool isPassword;

  const CustomTextField({
    super.key,
    this.labelText,
    required this.hintText,
    this.textEC,
    this.isPassword = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

bool hidden = true;

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
                    hidden = !hidden;
                  });
                },
                icon: Icon(
                  hidden ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
      ),
      controller: widget.textEC,
      obscureText: widget.isPassword ? hidden : false,
    );
  }
}
