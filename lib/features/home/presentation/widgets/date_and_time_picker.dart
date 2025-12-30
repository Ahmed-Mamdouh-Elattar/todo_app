import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/config/app_color.dart';
import 'package:todo_app/features/home/presentation/widgets/picker_text_field.dart';

class TimeAndDatePicker extends StatelessWidget {
  const TimeAndDatePicker({
    required this.dateController,
    required this.shade100,
    required this.outlineInputBorder,
    required this.timeController,
    super.key,
  });

  final TextEditingController dateController;
  final Color shade100;
  final OutlineInputBorder outlineInputBorder;
  final TextEditingController timeController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: PickerTextField(
            controller: dateController,
            title: "Date",
            hint: "Select date",
            selectTime: selectDate,
            shade1002: shade100,
            outlineInputBorder: outlineInputBorder,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: PickerTextField(
            controller: timeController,
            title: "Time",
            hint: "Select time",
            selectTime: selectTime,
            shade1002: shade100,
            outlineInputBorder: outlineInputBorder,
          ),
        ),
      ],
    );
  }

  Future<Null> Function(BuildContext) get selectDate =>
      (BuildContext context) async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: AppColor.primary,
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                ),
              ),
              child: child!,
            );
          },
        );

        if (picked != null) {
          dateController.text = DateFormat('MMM, d yyyy').format(picked);
        }
      };
  Future<Null> Function(BuildContext) get selectTime =>
      (BuildContext context) async {
        TimeOfDay? picked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: AppColor.primary,
                  onSurface: Colors.black,
                ),
              ),
              child: child!,
            );
          },
        );

        if (picked != null && context.mounted) {
          timeController.text = picked.format(context);
        }
      };
}
