import 'package:flutter/material.dart';

import '../color.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FormFieldSetter onFieldSubmittedValue;
  final FormFieldValidator onValidator;

  final TextInputType keyboardType;
  final String hintText;
  final bool isObscure;
  final bool enable, autoFocus;

  const TextInputField({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.onFieldSubmittedValue,
    required this.onValidator,
    required this.keyboardType,
    required this.hintText,
    required this.isObscure,
    this.enable = true,
    this.autoFocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        obscureText: isObscure,
        onFieldSubmitted: onFieldSubmittedValue,
        validator: onValidator,
        keyboardType: keyboardType,
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(height: 0, fontSize: 19),
        decoration: InputDecoration(
          hintText: hintText,
          enabled: enable,
          contentPadding: EdgeInsets.all(16),
          hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
              height: 0,
              color: AppColors.primaryTextTextColor.withOpacity(0.8)),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textFieldDefaultFocus),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondaryColor),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.alertColor),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.textFieldDefaultBorderColor),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
    );
  }
}
