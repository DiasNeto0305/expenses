import 'package:expenses/components/adaptative_datepicker.dart';
import 'package:expenses/components/adaptative_textfield.dart';
import 'package:flutter/material.dart';
import 'adaptative_button..dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  var _selectedDate = DateTime.now();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) return;

    widget.onSubmit(title, value, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              AdaptativeTextField(
                controller: titleController,
                onSubmit: _submitForm,
                label: 'Título',
                keyboardNumber: false,
              ),
              AdaptativeTextField(
                label: 'Valor (R\$)',
                keyboardNumber: true,
                onSubmit: _submitForm,
                controller: valueController,
              ),
              AdaptativeDatePicker(
                onDateChange: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
                selectedDate: _selectedDate,
              ),
              AdaptativeButton(
                label: 'Nova Transação',
                onPressed: _submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
