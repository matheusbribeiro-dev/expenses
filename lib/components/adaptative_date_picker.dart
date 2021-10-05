import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChange;

  const AdaptativeDatePicker(
      {Key? key, required this.selectedDate, required this.onDateChange})
      : super(key: key);

  _showDatePicker(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }

      onDateChange(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
          height: 180,
          child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2020),
              maximumDate: DateTime.now(), 
              onDateTimeChanged: onDateChange
            ),
        )
        : Container(
            height: 70,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    // ignore: unnecessary_null_comparison
                    selectedDate == null
                        ? 'Nenhuma data selecionada!'
                        : "Data Selecionada: ${DateFormat('dd/MM/y').format(selectedDate)}",
                  ),
                ),
                TextButton(
                    onPressed: () => _showDatePicker(context),
                    child: const Text(
                      'Selecionar Data',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          );
  }
}
