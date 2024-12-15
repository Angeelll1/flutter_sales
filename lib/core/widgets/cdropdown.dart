import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CDropdown extends StatelessWidget {
  // Key? key;
  final List<String> itemList;
  final RxString selectedValue;
  final controller;
  final bool isValid;

  CDropdown({
    // Key? key,
    required this.itemList,
    required this.selectedValue,
    this.controller,
    required this.isValid,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    Widget dropDown() {
      return DropdownButtonHideUnderline(
        child: Obx(
          () => DropdownButtonFormField2<String>(
            validator: isValid
                ? (value) => value == null ? 'Please choose one value' : null
                : null,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            iconStyleData: IconStyleData(
              icon: Icon(
                Icons.keyboard_arrow_down_sharp,
                color: Colors.grey,
              ),
            ),
            value: selectedValue.value == "" ? null : selectedValue.value,
            isExpanded: true,
            onChanged: (value) async {
              selectedValue.value = value.toString();
              if (controller != null) {
                controller.getOption();
              }
            },
            dropdownStyleData: DropdownStyleData(
              elevation: 1,
              maxHeight: 200,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              offset: Offset(0, -5),
            ),
            // dropdownSearchData: searchField(),
            onMenuStateChange: (isOpen) {
              if (!isOpen) {
                searchController.clear();
              }
            },
            menuItemStyleData: MenuItemStyleData(
              selectedMenuItemBuilder: (context, child) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Text(
                    selectedValue.value,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                );
              },
            ),
            items: itemList.map((String val) {
              return DropdownMenuItem<String>(
                value: val,
                child: Text(
                  val,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
    }

    return dropDown();
  }
}
