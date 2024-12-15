import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/salesman_controller.dart';

class SalesmanDropdown extends GetView<SalesmanController> {
  const SalesmanDropdown({
    Key? key,
    required this.title,
    required this.lsItem,
    // required this.index
  }) : super(key: key);

  final String title;
  final RxList<dynamic> lsItem;
  // final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pilih ${title}   : ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10),
            Expanded(
              child: DropdownButtonFormField(
                isExpanded: true,
                hint: Text("Pilih ${title}"),
                value: lsItem.isNotEmpty ? lsItem[0] : null,
                items: lsItem.map((value) {
                  return DropdownMenuItem(
                    child: Text(
                      title == 'Toko'
                          ? '${value.subdist_name}'
                          : '${value.chiller_id}',
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    ),
                    value: value,
                  );
                }).toList(),
                onChanged: controller.isReadOnly.value
                    ? null
                    : (value) async {
                        await controller.setDropDown(title, value!);
                        controller.getListChiller();
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
