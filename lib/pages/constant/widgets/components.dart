import 'package:flutter/material.dart';

Widget customTextFieldUsingInitialValue(BuildContext context, String labeltext,
    var initialvalue, Function(String) onChange) {
  return TextFormField(
    // keyboardType: TextInputType.multiline,
    // maxLines: null,
    initialValue: initialvalue,
    onChanged: onChange,
    validator: (value) {
      if (value!.isEmpty) {
        return "Please enter required data";
      } else {
        return null;
      }
    },
    decoration: InputDecoration(
      labelText: labeltext,
      labelStyle: const TextStyle(
        color: Colors.black,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(05),
        borderSide: const BorderSide(
          width: 2,
          color: Colors.grey,
        ), //<-- SEE HERE
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(05),

        borderSide: const BorderSide(
          width: 2,
          color: Colors.grey,
        ), //<-- SEE HERE
      ),
    ),
  );
}
