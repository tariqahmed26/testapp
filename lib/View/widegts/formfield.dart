import 'package:flutter/material.dart';

class CustomFormTextFields extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  const CustomFormTextFields({
    required this.controller,
    required this.label,
    this.isPassword = false,
  });
  @override
  State<CustomFormTextFields> createState() => _CustomFormTextFieldsState();
}

class _CustomFormTextFieldsState extends State<CustomFormTextFields> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label, // Access label through widget
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword
              ? !_isPasswordVisible
              : false, // Access controller through widget
          // style: TextStyle(color: Colors.white, fontSize: 14),
          decoration: InputDecoration(
            // filled: true,
            // fillColor: Color(0xff0E0223),
            suffixIcon: widget.isPassword
                ? InkWell(
                    onTap: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    child: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Color(0xff7F4CD2),
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
