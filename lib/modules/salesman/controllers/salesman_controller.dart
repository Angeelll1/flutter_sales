import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/mode.dart';
import '../../../core/constants/url.dart';
import '../../../core/manager/session.dart';
import '../../../core/model/m_chiller.dart';
import '../../../core/model/m_subdist.dart';
import '../../../core/model/m_user.dart';
import '../../../core/providers/api_callback.dart';
import '../../../core/widgets/preview_photo.dart';
import '../../../core/widgets/snackbar.dart';

class SalesmanController extends GetxController {
  var txtPath = TextEditingController().obs;

  var dropdownValue;

  var isLoading = true.obs;
  var isReadOnly = false.obs;

  File imagePreview = new File('');

  var string = '';

  var chiller = ''.obs;
  var lsSubdist = [].obs;
  var lsChiller = [].obs;
  var subdist = ''.obs;
  var lsItem = [].obs;

  var tabIndex = 0.obs;

  var detectionString = ''.obs;

  ImagePicker picker = ImagePicker();

  MUser? mUser;

  @override
  void onInit() async {
    mUser = MUser.fromJson(await Session.getObject(SessionCode.mUser));

    lsSubdist = await getListSubdist();

    subdist.value = lsSubdist[0].subdist_id;

    await getListChiller();

    chiller.value = lsChiller[0].chiller_id;

    isLoading(false);

    super.onInit();
  }

  void changeTabIndex(int index) {
    print("Changing tab index to: $index"); // Tambahkan log

    tabIndex.value = index;
  }

  // Future<List<MSubdist>>
  getListSubdist() async {
    try {
      var result = [].obs;

      var jsonAuth = await ApiCallback().execute(
          url: URL.API_JS + '/auth/subdist',
          method: MODE.post,
          body: {"username": "${mUser!.username}"});

      var jsonAuthData = jsonAuth["data"];

      jsonAuthData.forEach((v) {
        result.add(MSubdist.fromJson(v));
      });

      return result;
    } catch (e) {
      print("error = " + e.toString());

      CSnackBar.showError(message: e.toString());

      return [];
    }
  }

  getListChiller() async {
    print('get chiller');

    lsChiller.clear();
    lsChiller.refresh();

    try {
      var jsonAuth = await ApiCallback().execute(
          url: URL.API_JS + '/auth/chiller',
          method: MODE.post,
          body: {"subdist_id": "${subdist.value}"});

      var jsonAuthData = jsonAuth["data"];

      jsonAuthData.forEach((v) {
        lsChiller.add(MChiller.fromJson(v));
      });
    } catch (e) {
      print("error = " + e.toString());

      CSnackBar.showError(message: e.toString());
    }
  }

  setDropDown(
    title,
    newValue,
  ) async {
    dropdownValue = newValue;
    title == 'Toko'
        ? subdist.value = newValue.subdist_id!
        : chiller.value = newValue.chiller_id!;
  }

  pickPhoto() async {
    Get.dialog(
      AlertDialog(
        title: Center(
          child: Text('Pick Image'),
        ),
        content: Row(
          children: [
            ElevatedButton.icon(
              onPressed: () async {
                pickFromCamera();
              },
              icon: Icon(Icons.camera_alt),
              label: Text('Camera'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.sourcingRed),
            ),
            Spacer(),
            ElevatedButton.icon(
              onPressed: () async {
                pickFromGallery();
              },
              icon: Icon(Icons.image),
              label: Text('Gallery'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.sourcingRed),
            )
          ],
        ),
      ),
    );
  }

  pickFromCamera() async {
    Get.back();
    XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 100,
    );
    if (image != null) {
      Directory dir = Directory(
        '/data/user/0/com.example.flutter_mayora_sales/cache/image',
      );

      await new Directory(dir.path).create();

      var fileImage = File(image.path);

      imagePreview = File(fileImage.path);
      txtPath.value.text = fileImage.path;
      txtPath.refresh();
    } else {
      imagePreview = File("");
      txtPath.value.text = "";
      txtPath.refresh();
    }
  }

  pickFromGallery() async {
    Get.back();
    XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    if (image != null) {
      var imageCrop = File(image.path);

      // imageCrop = await cropImage(File(image.path));

      imagePreview = File(imageCrop.path);
      txtPath.value.text = imageCrop.path;
      txtPath.refresh();
    } else {
      imagePreview = File("");
      txtPath.value.text = "";
      txtPath.refresh();
    }
  }

  void toPreviewPhoto(String path) {
    Get.to(() => PreviewPhoto(tag: "Preview Attachment", path: path));
  }

  deleteImage() {
    isReadOnly(false);
    imagePreview = File("");
    txtPath.value.text = "";
    txtPath.refresh();
  }

  onSubmit() async {
    if (txtPath.value.text.isEmpty) {
      CSnackBar.showError(message: "Please select an image before submitting.");
      return;
    }

    isLoading.value = true;

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(URL.FLASK + '/predict'),
    );

    request.files.add(await http.MultipartFile.fromPath(
      'file',
      txtPath.value.text,
    ));

    request.fields['subdist_id'] = subdist.value;
    request.fields['chiller_id'] = chiller.value; //belum ke init
    request.fields['send_date'] = DateTime.now().toIso8601String();

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await http.Response.fromStream(response);
        final data = json.decode(responseData.body); // Decode JSON

        String imagePath = data['path'];

        var resultDetection = data['detections'];

        var detectionList = resultDetection.entries.map((entry) {
          return '${entry.key}: ${entry.value}';
        }).toList();

        detectionString.value = detectionList.join('\n');

        print(detectionString.value);

        txtPath.value.text = imagePath; // Update path untuk menampilkan gambar
        txtPath.refresh(); // Memperbarui UI

        isReadOnly(true);
      } else {
        CSnackBar.showError(message: "Failed to upload image.");
      }
    } catch (e) {
      CSnackBar.showError(message: "Error: ${e.toString()}");
    }

    isLoading.value = false;
  }
}
