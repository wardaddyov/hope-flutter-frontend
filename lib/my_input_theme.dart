import 'package:flutter/material.dart';
import 'package:hope/custom_colors.dart';

class MyInputTheme{

  TextStyle _buildTextStyle(Color color, {double size = 16.0}){
    return TextStyle(
      color: color,
      fontSize: size
    );
  }

  OutlineInputBorder _buildBorder(Color color, {double width = 1.0}){
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: color,
        width: width
      )
    );
  }

  InputDecorationTheme theme () => InputDecorationTheme(
    contentPadding: EdgeInsets.all(20),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    constraints: BoxConstraints(maxWidth: 200),

    /// Borders
    // enabled and not showing error
    enabledBorder: _buildBorder(Colors.grey[600]!),
    // has error but not focus
    errorBorder: _buildBorder(Colors.red, width: 2),
    // has error and focus
    focusedErrorBorder: _buildBorder(Colors.red, width: 2),
    // default value if borders are null
    border: _buildBorder(Colors.yellow),
    // enabled and focused
    focusedBorder: _buildBorder(CustomColors.borderColor, width: 2),
    // disabled
    disabledBorder: _buildBorder(Colors.grey[400]!),

    /// TextStyles
    suffixStyle: _buildTextStyle(Colors.black),
    counterStyle: _buildTextStyle(Colors.grey, size: 12.0),
    floatingLabelStyle: _buildTextStyle(CustomColors.borderColor, size: 20.0),
    // make error and helper the same size, so that the field does not grow in
    // height when there is an error text
    errorStyle: _buildTextStyle(Colors.red, size: 12.0),
    helperStyle: _buildTextStyle(Colors.black, size: 12.0),
    hintStyle: _buildTextStyle(Colors.grey),
    labelStyle: _buildTextStyle(Colors.black, size: 20.0),
    prefixStyle: _buildTextStyle(Colors.black),

    /// Icon
    prefixIconColor: Colors.grey[800]
  );
}