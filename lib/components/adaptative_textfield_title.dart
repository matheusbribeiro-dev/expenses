import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptativeTextFieldTitle extends StatelessWidget
{
  final TextEditingController controller;
  final Function() onSubmit;

  const AdaptativeTextFieldTitle({
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
          onSubmitted: (_) => onSubmit,
          placeholder: 'Título',
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 12
          ),
        ),
    )
    : TextField(
        controller: controller,
        onSubmitted: (_) => onSubmit,
        decoration: const InputDecoration(labelText: 'Título')
      );
  }
}