import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButtton extends StatelessWidget
{
  final String label;
  final Function() onPressed; 

  const AdaptativeButtton({
    Key? key,
    required this.label,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context)
  { 
    return Platform.isIOS 
    ? CupertinoButton(
        child: Text(label),
        onPressed: onPressed,
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 20
        ),
      )
    : ElevatedButton(
        onPressed: onPressed, 
        child: Text(label),
      );
  }
}