import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/mode.dart';
import '../../../core/constants/url.dart';
import '../../../core/model/t_chiller_detection.dart';
import '../../../core/providers/api_callback.dart';
import '../../../core/widgets/snackbar.dart';
import '../../../navigation/pages.dart';

class PicController extends GetxController {
  var tdDate = new TextEditingController().obs;
  var txtPath = TextEditingController().obs;

  var lsSubdist = [].obs;
  var lsChiller = [].obs;
  // RxList<String> lsSubdist = <String>[].obs;
  var subdist = ''.obs;
  var queryString = "".obs;
  var lsItem = [].obs;

  var lsHistory = [].obs;

  var isLoading = true.obs;

  var tabIndex = 0.obs;

  var startDate = DateFormat('yyyy-MM-dd')
      .format(DateTime.now().subtract(Duration(days: 1)))
      .obs;
  var endDate = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;

  var searchQueryController = TextEditingController();

  var fromFilter = false.obs;

  @override
  void onInit() async {
    tdDate.value.text = getFormatedTime(format: "dd-MM-yyyy HH:mm");

    await getListHistory();

    isLoading(false);

    super.onInit();
  }

  onSelectDate(DateTimeRange date) async {
    startDate.value = DateFormat('yyyy-MM-dd').format(date.start);
    endDate.value = DateFormat('yyyy-MM-dd').format(date.end);

    fromFilter(true);
  }

  onFilterData() async {
    isLoading(true);

    lsHistory.clear();

    try {
      // Mengatur URL dengan parameter filter
      String url = '${URL.API_JS}/auth/browse';
      if (subdist.value.isNotEmpty || fromFilter.value) {
        url += '?';
        if (subdist.value.isNotEmpty) {
          url += 'subdist_id=${subdist.value}';
        }
        if (fromFilter.value) {
          url += '&start_date=${startDate.value}&end_date=${endDate.value}';
        }
      }

      // Memanggil API dengan filter yang ditentukan
      var response = await ApiCallback().execute(
        url: url,
        method: MODE.get,
      );

      var jsonData = response["data"];

      jsonData.forEach((v) {
        lsHistory.add(History.fromJson(v));
      });

      isLoading(false);
    } catch (e) {
      isLoading(false);
      print("Error during filtering: ${e.toString()}");
      CSnackBar.showError(message: e.toString());
    }
  }

  onRemoveFilter(context) async {
    isLoading(true);

    Scaffold.of(context).closeEndDrawer();

    lsHistory.clear();

    await getListHistory();

    isLoading(false);
  }

  onQuerySearch(query) async {
    queryString.value = query.toString();
  }

  String getFormatedTime({format = "yyyy-MM-dd HH:mm:ss", dateTime}) {
    if (dateTime == null) dateTime = DateTime.now();

    return DateFormat(format).format(dateTime);
  }

  pickDateTimeSuperior(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 30)),
        lastDate: DateTime.now().add(Duration(days: 1)),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light(),
            child: child!,
          );
        });

    if (pickedDate == null) return;

    TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(DateTime.now()),
        builder: (BuildContext context, Widget? child) => Theme(
              data: ThemeData.light(),
              child: child!,
            ));

    if (pickedTime == null) return;

    String formattedTime =
        "${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}";

    tdDate.value.text =
        "${DateFormat("dd-MM-yyyy").format(pickedDate)} $formattedTime";
  }

  getListHistory() async {
    try {
      var jsonAuth = await ApiCallback().execute(
        url: URL.API_JS + '/auth/browse',
        method: MODE.get,
      );

      var jsonAuthData = jsonAuth["data"];

      jsonAuthData.forEach((v) {
        lsHistory.add(History.fromJson(v));
      });
    } catch (e) {
      print("error = " + e.toString());

      CSnackBar.showError(message: e.toString());
    }
  }

  onTap(index) async {
    Get.toNamed(Routes.picResult, arguments: {"result": lsHistory[index]});
  }

  void changeTabIndex(int index) {
    print("Changing tab index to: $index"); // Tambahkan log

    tabIndex.value = index;

    // tabIndex.value == 0
    //     ? Get.offAndToNamed(Routes.picResult)
    //     : Get.offAndToNamed(Routes.sales);
    // update();
  }
}
