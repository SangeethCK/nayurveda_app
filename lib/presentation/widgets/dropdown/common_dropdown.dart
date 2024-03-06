import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:nayurveda_app/core/constant/color.dart';
import 'package:nayurveda_app/presentation/widgets/text/text_utils.dart';

import 'models/drop_down.dart';

class CommonDropdown extends StatelessWidget {
  final String hintText;
  final List<DropDownValue> dropDownValue;
  final DropDownValue? selecteItem;
  final Function onChanged;
  final bool showSearchBox;
  final bool isVisibleClearButton;
  final FormFieldValidator<DropDownValue>? validator;
  final bool? isEnabled;
  final Function? function;
  final double? radius;
  final bool isColor;
  const CommonDropdown({
    super.key,
    required this.hintText,
    required this.dropDownValue,
    this.selecteItem,
    required this.onChanged,
    this.showSearchBox = true,
    this.validator,
    this.isEnabled,
    this.function,
    this.radius,
    this.isColor = false,
    this.isVisibleClearButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<DropDownValue>(
      items: dropDownValue,
      selectedItem: selecteItem,
      validator: validator,
      enabled: isEnabled ?? true,
      clearButtonProps: ClearButtonProps(
        padding: EdgeInsets.zero,
        iconSize: 19,
        splashRadius: 10,
        color: primaryColor,
        constraints: const BoxConstraints(maxWidth: 15),
        isVisible: isVisibleClearButton,
        icon: const Icon(Icons.close),
      ),
      onChanged: (value) {
        onChanged(value);
      },
      popupProps: PopupProps.menu(
        fit: FlexFit.loose,
        showSearchBox: showSearchBox,
        menuProps: const MenuProps(
          backgroundColor: Colors.white,
          elevation: 2.0,
        ),
        itemBuilder: customPopupItemBuilder,
        searchFieldProps: const TextFieldProps(
            cursorColor: Colors.black,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              hintText: 'Search',
              hintStyle: TextStyle(
                color: Color(0xffCBD2E0),
                fontSize: 10,
              ),
              errorStyle: TextStyle(height: 0.1),
              errorText: null,
              isDense: true,
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
              ),
              prefixIconConstraints: BoxConstraints(maxHeight: 20),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffCBD2E0), width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  )),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(217, 217, 217, 0.25), width: 2.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  )),
            )),
        containerBuilder: (ctx, popupWidget) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: Container(
                  child: popupWidget,
                ),
              ),
            ],
          );
        },
      ),
      dropdownButtonProps: const DropdownButtonProps(
        isVisible: true,
        splashRadius: 10,
        padding: EdgeInsets.only(left: 15),
      ),
      dropdownBuilder: selectedDropDownstyle,
      dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
              // suffix: Icon(Icons.abc),
              // suffixIcon:Icon(Icons.downhill_skiing),
              suffixIconConstraints: const BoxConstraints(maxHeight: 44),
              hintText: hintText,
              isDense: true,
              filled: true,
              fillColor: const Color.fromRGBO(217, 217, 217, 0.25),
              errorStyle: const TextStyle(height: 0.9),
              errorText: null,
              hintStyle: const TextStyle(
                color: Colors.black,
                fontSize: 10,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 0.1), width: .89),
                  borderRadius: BorderRadius.all(
                    Radius.circular(radius ?? 6),
                  )),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color(0xffCBD2E0).withOpacity(0.5)),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6),
                  )),
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.red),
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  )),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.red),
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  )))),
    );
  }

  Widget selectedDropDownstyle(
    BuildContext context,
    DropDownValue? item,
  ) {
    if (item == null) {
      return Text(
        hintText,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextUtils.theme.titleSmall?.copyWith(
          color: const Color(0xffCBD2E0),
          fontSize: 10,
        ),
      );
    } else {
      return Text(
        item.value ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Colors.black, fontSize: 12),
      );
    }
  }

  Widget customPopupItemBuilder(
    BuildContext context,
    DropDownValue? item,
    bool isSelected,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Text(item?.value ?? '',
                  style: TextUtils.theme.titleSmall?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                    color: kBlack54,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
