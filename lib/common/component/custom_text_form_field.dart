import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jeju_shopping/common/const/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;

  final TextEditingController? controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final String? hintText;
  final Widget? suffixIcon;
  final int? maxLength;
  final int? maxLines;
  final bool realOnly;
  final bool enabled;
  final VoidCallback? onEditingComplete;
  final FocusNode? focusNode;
  final double contentPaddingVertical;

  const CustomTextFormField({
    Key? key,
    required this.onChanged,
    required this.onSaved,
    required this.validator,
    this.controller,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.obscureText = false,
    this.hintText,
    this.suffixIcon,
    this.maxLength,
    this.maxLines = 1,
    this.realOnly = false,
    this.enabled = true,
    this.onEditingComplete,
    this.focusNode,
    this.contentPaddingVertical = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      controller: controller,
      onEditingComplete: onEditingComplete,
      focusNode: focusNode,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: contentPaddingVertical,
          horizontal: 12.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      style: MyTextStyle.descriptionRegular,
      maxLength: maxLength,
      maxLines: maxLines,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      inputFormatters: textInputType == TextInputType.number
          ? [FilteringTextInputFormatter.digitsOnly]
          : [],
      readOnly: realOnly,
      enabled: enabled,
    );
  }
}
