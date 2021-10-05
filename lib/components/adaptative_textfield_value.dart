import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptativeTextFieldValue extends StatelessWidget
{
  final TextEditingController controller;
  final Function() onSubmit;

  const AdaptativeTextFieldValue({
    Key? key,
    required this.controller,
    required this.onSubmit
  }) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Platform.isIOS
    ? Padding(
      padding: const EdgeInsets.only(
        bottom: 10
      ),
      child: CupertinoTextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          onSubmitted: (_) => onSubmit,
          placeholder: 'Valor (R\$)',
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 12
          ),
        ),
    )
    : TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        onSubmitted: (_) => onSubmit,
        decoration: const InputDecoration(labelText: 'Valor (R\$)')
      );
  }
}