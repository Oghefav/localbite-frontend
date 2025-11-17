import 'package:flutter/material.dart';
import 'package:locabite/core/utility/app_colours.dart';
import 'package:locabite/core/utility/demensions.dart';

InputDecoration customInputDecoration({required String hintText, required String labelText, String? prefixText, bool? alignLabelWithHint}) {
  // ignore: unused_local_variable
  final InputDecoration inputDecoration = InputDecoration(
    hintText: hintText,
    labelText: labelText,
    prefixText: prefixText,
    alignLabelWithHint: alignLabelWithHint,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Demensions.radius15),
      borderSide: BorderSide(style: BorderStyle.solid, width: 2),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Demensions.radius15),
      borderSide: BorderSide(
        style: BorderStyle.solid,
        width: 2,
        color: Colors.red.shade300,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Demensions.radius15),
      borderSide: BorderSide(
        color: AppColours.black,
        style: BorderStyle.solid,
        width: 2,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Demensions.radius15),
      borderSide: BorderSide(
        color: AppColours.black,
        style: BorderStyle.solid,
        width: 2,
      ),
    ),
  );
  return inputDecoration;
}
