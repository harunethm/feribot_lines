import 'package:flutter/material.dart';

import '../utils/colors_const.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hint;
  final IconData icon;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validation;

  const CustomTextFormField(
    this.title,
    this.hint,
    this.icon,
    this.keyboardType, {
    Key? key,
    this.controller,
    this.validation,
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
          // onChanged: (text) {},
          keyboardType: keyboardType,
          textInputAction: TextInputAction.next,
          controller: controller,
          decoration: InputDecoration(
            prefixIconConstraints:
                const BoxConstraints(minWidth: 35, maxHeight: 35),
            prefixIcon: Padding(
              padding: const EdgeInsetsDirectional.only(start: 12.0, end: 5.0),
              child: Icon(
                icon,
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
