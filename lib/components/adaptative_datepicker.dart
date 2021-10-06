import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChange;

  AdaptativeDatePicker({
    required this.selectedDate,
    required this.onDateChange,
  });

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;

      onDateChange(pickedDate);
      // setState(() {
      //   _selectedDate = pickedDate;
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
          height: 180,
          child: CupertinoDatePicker(
              onDateTimeChanged: onDateChange,
              mode: CupertinoDatePickerMode.date,
              maximumDate: DateTime.now(),
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2019),
            ),
        )
        : Container(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Text(DateFormat('dd/MM/y').format(selectedDate)),
                ),
                TextButton(
                  onPressed: () => _showDatePicker(context),
                  child: Text(
                    'Selecionar Data',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                )
              ],
            ),
          );
  }
}
