import 'package:flutter/material.dart';

import '../utils/colors_const.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hint;
  final IconData icon;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? value;
  final String? Function(String?)? validation;
  final VoidCallback? Function(String)? onChange;

  const CustomTextFormField(
    this.title,
    this.hint,
    this.icon,
    this.keyboardType, {
    Key? key,
    this.value,
    this.controller,
    this.validation,
    this.onChange,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 15),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          focusNode: focusNode,
          validator: validation,
          onChanged: onChange,
          keyboardType: keyboardType,
          initialValue: value,
          textInputAction: TextInputAction.next,
          controller: controller,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            prefixIconConstraints:
                const BoxConstraints(minWidth: 35, maxHeight: 35),
            prefixIcon: Padding(
              padding: const EdgeInsetsDirectional.only(start: 12.0, end: 5.0),
              child: Icon(
                icon,
                size: 20,
                color: ColorsConstants.lightAccent,
              ),
            ),
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
