import 'package:flutter/material.dart';


// ! in this widget or any other widget in general you can add any attribut BUT make it nullable ?
// ! so that we don't need to set thier value on all old use of this widget

class MyTextFormField extends StatelessWidget {
  
  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? hintStyle;
	final String? Function(String?)? validator;
  final bool? obscureText;  
  final double? borderRadius;
  final BorderSide? borderSide;
	final VoidCallback? onTap;
	final Function(PointerDownEvent)? onTapOutside;
	final Function(String?)? onChanged;
  final Color? fillColor;
  final TextStyle? inputStyle;
  final EdgeInsets? contentPadding;

  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool enableSuggestions;
  final bool expands;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  

  const MyTextFormField({super.key, this.controller, this.hintText, this.hintStyle,
                        this.obscureText, this.validator, this.borderRadius, this.borderSide,
                        this.onTap, this.onChanged, this.fillColor, this.inputStyle, this.contentPadding,
                        this.maxLines=1, this.minLines, this.enableSuggestions=true, this.expands=false,
                        this.keyboardType, this.maxLength, this.focusNode, this.onTapOutside});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      onTap: onTap,
      onTapOutside: onTapOutside,
      style: inputStyle,
      textAlignVertical: TextAlignVertical.center,
      // ! ------
      maxLength:maxLength,
      maxLines: maxLines,
      minLines: minLines,
      enableSuggestions: enableSuggestions,
      expands: expands,
      keyboardType: keyboardType,
      focusNode: focusNode,

      decoration: InputDecoration(
        contentPadding: contentPadding,
        fillColor: fillColor,
        filled: fillColor==null ? false : true,
        hintText: hintText,
        hintStyle: hintStyle,
        border : OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          borderSide: borderSide ?? BorderSide.none,
        ),
      
      ),
   
    );

  }
}