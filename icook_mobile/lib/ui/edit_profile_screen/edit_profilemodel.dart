import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:icook_mobile/core/constants/api_routes.dart';
import 'package:icook_mobile/core/constants/view_state.dart';
import 'package:icook_mobile/core/mixins/validators.dart';
import 'package:icook_mobile/core/services/Api/ApiService.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/ui/base_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';

import '../../locator.dart';

class EditProfileModel extends BaseNotifier with Validators {
  final key = locator<KeyStorageService>();
  final dio = Dio();
  //formkey
  final formkey = GlobalKey<FormState>();
  final node = FocusScopeNode();

  String _imageUrl = "";

  String get imageUrl => _imageUrl;

  //textcontrolers
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  final bio = TextEditingController();

  //scaffoldkey
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  void init() {
    name.text = key.name;
    email.text = key.email;
    _imageUrl = key.profileImageUrl;
  }

  PickedFile file;
  final ImagePicker _picker = ImagePicker();
  List<File> files = [];
  String url = '';

  final api = locator<ApiService>();

  Future<void> chooseImage() async {
    final pickedFile = await _picker.getImage(
      source: ImageSource.gallery,
      maxWidth: 100,
      maxHeight: 100,
      imageQuality: 100,
    );

    print('Piclllllleeee ${pickedFile.path}');
    setState(ViewState.Busy);

    final dddd = File(pickedFile.path);

    final response = await _uploadImage(dddd);
    final status = response['status'];
    print(status);
    if (status == 'success') {
      _imageUrl = response['data']['URL'];
      key.profileImageUrl = response['data']['URL'];
      setState(ViewState.Idle);
    }
    print(response);
  }

  Future<Map<String, dynamic>> _uploadImage(File image) async {
    print('seeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
    print(image.path);
    Uri apiUrl = Uri.parse(
        'https://floating-plains-18946.herokuapp.com/api/v1/me/upload_photo');

    Map<String, String> headers = {"Authorization": "${key.token}"};
    print(headers);

    final mimeTypeData =
        lookupMimeType(image.path, headerBytes: [0xFF, 0xD8]).split('/');
    print(mimeTypeData);

    // Intilize the multipart request
    final imageUploadRequest = http.MultipartRequest('PUT', apiUrl);

    // Attach the file in the request
    final file = await http.MultipartFile.fromPath('photo', image.path,
        contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
    // Explicitly pass the extension of the image with request body
    // Since image_picker has some bugs due which it mixes up
    // image extension with file name like this filenamejpge
    // Which creates some problem at the server side to manage
    // or verify the file extension

//    imageUploadRequest.fields['ext'] = mimeTypeData[1];
    imageUploadRequest.headers.addAll(headers);
    imageUploadRequest.files.add(file);
    // imageUploadRequest.fields['name'] = _name;
    // imageUploadRequest.fields['email'] = _email;
    // imageUploadRequest.fields['contact_no'] = _contact;

    try {
      final streamedResponse = await imageUploadRequest.send();
      final response = await http.Response.fromStream(streamedResponse);
      print(response.body);
      if (response.statusCode != 200) {
        return null;
      }

      final Map<String, dynamic> responseData = json.decode(response.body);
      print(responseData);
      return responseData;
    } catch (e) {
      print(e);
      setState(ViewState.Idle);
      return null;
    }
  }
}
