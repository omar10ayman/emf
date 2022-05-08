import 'package:flutter/material.dart';

Widget defualtTextform(
        {required TextEditingController controller,
        var labal,
        required Function vaild,
        required Function onchange,
        required var suffix}) =>
    TextFormField(
        validator: ((v) {
          return vaild(v);
        }),
        controller: controller,
        keyboardType: TextInputType.number,
        onChanged: (value) {
          // ignore: void_checks
          return onchange(value);
        },
        decoration: InputDecoration(
          labelText: labal,
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          suffixIcon: suffix,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 4, 102, 183),
                width: 2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 2,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15))),
        ));
