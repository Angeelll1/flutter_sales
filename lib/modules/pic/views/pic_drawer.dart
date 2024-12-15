import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../controllers/pic_controller.dart';

class PicDrawer extends GetView<PicController> {
  @override
  Widget build(BuildContext context) {
    Widget datePicker(context) {
      return GestureDetector(
        onTap: () async {
          final picked = await showDateRangePicker(
            context: context,
            currentDate: DateTime.now(),
            lastDate: (new DateTime.now()),
            firstDate: DateTime(DateTime.now().year),
            initialDateRange: DateTimeRange(
              start: DateTime.parse(controller.startDate.value),
              end: DateTime.parse(controller.endDate.value),
            ),
          );
          if (picked != null) {
            await controller.onSelectDate(picked);
          }
        },
        child: Container(
          height: 50,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 0.5),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${controller.startDate.value} - ${controller.endDate.value}',
            ),
          ),
        ),
      );
    }

    Widget filterButton() {
      return GestureDetector(
        onTap: () {
          controller.onFilterData();
          Scaffold.of(context).closeEndDrawer();
        },
        child: Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.sourcingRed,
            borderRadius: BorderRadius.circular(8),
          ),
          height: 50,
          width: double.infinity,
          child: Center(
            child: Text(
              "Filter",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }

    Widget search() {
      return TextField(
        controller: controller.searchQueryController,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: "Cari...",
          contentPadding: EdgeInsets.all(10),
          border: InputBorder.none,
        ),
        style: TextStyle(color: Colors.black),
        onSubmitted: (query) => controller.onQuerySearch(query),
      );
    }

    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Filter"),
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  controller.onRemoveFilter(context);
                },
                icon: Icon(Icons.delete))
          ],
        ),
        backgroundColor: AppColors.backgroundWhite,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 12,
            ),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Filter By Subdist ID",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: search(),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Filter By Date",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  datePicker(context),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: filterButton(),
      ),
    );
  }
}
