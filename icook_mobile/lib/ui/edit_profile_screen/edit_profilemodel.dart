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

import '../../locator.dart';

class EditProfileModel extends BaseNotifier with Validators {
  final key = locator<KeyStorageService>();
  final dio = Dio();
  //formkey
  final formkey = GlobalKey<FormState>();
  final node = FocusScopeNode();

  String imageUrl = "";

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
    imageUrl = key.profileImageUrl;
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

    print(pickedFile.path);
    setState(ViewState.Busy);

    await uploadFile(File(pickedFile.path));

    // try {
    //   final headers = <String, String>{
    //     "Authorization": "${key.token}",
    //   };
    //   print('ewwwwwwwwwwwwwwwwwwwwwww $headers');
    //   FormData formData = FormData.fromMap({
    //     "photo": await MultipartFile.fromFile(pickedFile.path,
    //         filename: pickedFile.path.split('/').last)
    //   });

    //   dio.options.headers.addAll(headers);
    //   dio.options.contentType = "multipart/form-data";
    //   dio.interceptors.add(LogInterceptor());
    //   //dio.interceptors.add(LogInterceptor(requestBody: true));
    //   (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //       (HttpClient client) {
    //     client.findProxy = (uri) {
    //       //proxy all request to localhost:8888
    //       return "PROXY localhost:8888";
    //     };
    //     client.badCertificateCallback =
    //         (X509Certificate cert, String host, int port) => true;
    //   };

    //   print('fffffffffffffffffffffffff ${formData.toString()}');
    //   final response = await dio.put(
    //       'https://floating-plains-18946.herokuapp.com/api/v1/me/upload_photo',
    //       data: formData, onSendProgress: (received, total) {
    //     if (total != -1) {
    //       print((received / total * 100).toStringAsFixed(0) + "%");
    //     }
    //   });
    //   print(response);
    // } on DioError catch (e) {
    //   setState(ViewState.Idle);
    //   print('image upload exception ${e.message}');
    //   print('image upload exception ${e.response.data}');
    //   final snackbar = SnackBar(content: Text(e.message));
    //   scaffoldKey.currentState.showSnackBar(snackbar);
    // }

    // try {
    //   final token = key.token ?? "";
    //   final headers = <String, String>{
    //     "Content-Type": "application/x-www-form-urlencoded",
    //     "Authorization": "$token"
    //   };

    //   final response = api.profilePic(
    //       ApiRoutes.uploadprofile, '', File(pickedFile.path), headers);
    //   print(response);
    // } catch (e) {
    //   setState(ViewState.Idle);
    //   print('image upload exception $e');
    //   final snackbar = SnackBar(content: Text(e.toString()));
    //   scaffoldKey.currentState.showSnackBar(snackbar);
    // }
  }

  Future<dynamic> uploadFile(File file) async {
    // Your endpoint
    final _path =
        "https://floating-plains-18946.herokuapp.com/api/v1/me/upload_photo";

    var result;

    // This is optional (If there are headers)
    Map<String, String> headers = {"Authorization": "${key.token}"};

    final multipartRequest = new http.MultipartRequest(
      'PUT',
      Uri.parse(_path),
    );

    // This is optional as well (If there are headers)
    multipartRequest.headers.addAll(headers);

    try {
      // Add the file to the request body
      // first argument: json key
      // second argument: file path
      // third argument: file name
      multipartRequest.files.add(await http.MultipartFile.fromPath(
        'photo',
        file.path,
        filename: file.path.split('/').last,
      ));
      // You can add more than one file to the request body

      // // you can add other fields to the request
      // multipartRequest.fields['aParam'] = aParam;
      // multipartRequest.fields['anotherParam'] = anotherParam;

      // Make the request
      // The timeout is optional as well
      final response = await multipartRequest.send().timeout(
            Duration(seconds: 15),
          );

      if (response != null) {
        print(response.statusCode);
        setState(ViewState.Idle);
        if (response.statusCode == 200) {
          // Response is a stream, you should convert to a String
          final responseString = await response.stream.bytesToString();

          result = jsonDecode(responseString);
          print(result);

          // Do whatever you want with the response

        }
      }
    } on SocketException {
      throw 'No Internet connection';
    } on FormatException {
      throw "Bad response format";
    }
    return result;
  }
}
