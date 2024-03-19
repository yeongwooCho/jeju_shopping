import 'package:flutter/material.dart';
import 'package:jeju_shopping/common/const/colors.dart';
import 'package:jeju_shopping/common/const/text_styles.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomDropDownButton extends StatefulWidget {
  final List<String> dropdownList;
  final String? defaultValue;
  final ValueChanged<String?> onChanged;
  final double menuMaxHeight;

  const CustomDropDownButton({
    Key? key,
    required this.dropdownList,
    required this.defaultValue,
    required this.onChanged,
    this.menuMaxHeight = 300.0,
  }) : super(key: key);

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: 2.0,
            color: MyColor.middleGrey,
          ),
          borderRadius: BorderRadius.circular(16.0),
          color: MyColor.lightGrey),
      child: DropdownButton(
        icon: PhosphorIcon(
          PhosphorIcons.caretDown(PhosphorIconsStyle.bold),
          color: MyColor.text,
        ),
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 24.0),
        menuMaxHeight: widget.menuMaxHeight,
        isExpanded: true,
        underline: const SizedBox(height: 1.0),
        style: MyTextStyle.bodyMedium.copyWith(
          color: MyColor.text,
        ),
        value: widget.defaultValue,
        items: widget.dropdownList.map((String item) {
          return DropdownMenuItem<String>(
            alignment: Alignment.center,
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: widget.onChanged,
      ),
    );
  }
}
