import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nayurveda_app/core/constant/color.dart';

class DatePickerContainer extends StatefulWidget {
  final String? hintText;
  final String? value;
  final Function changeDate;
  final bool clearDate;
  final bool isDisable;
  final DateTime? initialDate;
  final String? endDate;
  const DatePickerContainer({
    super.key,
    required this.hintText,
    this.value,
    required this.changeDate,
    this.clearDate = false,
    this.isDisable = false,
    this.endDate,
    this.initialDate,
  });

  @override
  State<DatePickerContainer> createState() => _DatePickerContainerState();
}

class _DatePickerContainerState extends State<DatePickerContainer> {
  DateTime selectedDate = DateTime.now();

  String? pickedDate;

  @override
  void initState() {
    super.initState();
    if (widget.value == null) {
      if (widget.clearDate == false) {
        pickedDate = apiFormat.format(selectedDate);
      }
    } else {
      pickedDate = widget.value;
      selectedDate = DateTime.parse(pickedDate!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xffB3B3BF).withOpacity(0.5)),
        color: const Color.fromRGBO(217, 217, 217, 0.25),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            final DateTime? picked = widget.isDisable == false
                ? await showDatePicker(
                    context: context,
                    initialDate: widget.initialDate ?? DateTime.now(),
                    firstDate: DateTime(2015),
                    lastDate: DateTime(2101),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          colorScheme: const ColorScheme.light(
                            primary: primaryColor,
                            onPrimary: Colors.black,
                            surface: Colors.white,
                            onSurface: Colors.black,
                          ),
                          dialogBackgroundColor: Colors.white,
                        ),
                        child: child!,
                      );
                    },
                  )
                : DateTime(0);
            if (widget.isDisable == false) {
              if (picked != null) {
                setState(() {
                  pickedDate = apiFormat.format(picked);
                  widget.changeDate(picked);
                });
              } else {
                if (widget.clearDate) {
                  setState(() {
                    pickedDate = null;
                    widget.changeDate(picked);
                  });
                }
              }
            }
          },
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 10, top: 13, bottom: 13),
            child: Row(
              children: [
                Expanded(
                    child: pickedDate != null
                        ? Text(
                            widget.isDisable == true ? '' : pickedDate ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          )
                        : Text(
                            widget.hintText ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Color(0xff828691),
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                          )),
                const Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.black87,
                  size: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final apiFormat = DateFormat('yyyy-MM-dd');
