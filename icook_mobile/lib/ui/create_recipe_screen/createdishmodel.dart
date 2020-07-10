import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:icook_mobile/core/constants/api_routes.dart';
import 'package:icook_mobile/core/constants/view_routes.dart';
import 'package:icook_mobile/core/constants/view_state.dart';
import 'package:icook_mobile/core/datasources/remotedata_source/DIsh/dishdatasource.dart';
import 'package:icook_mobile/core/mixins/validators.dart';
import 'package:icook_mobile/core/services/Api/ApiService.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/models/requests/Dish/postdish.dart';
import 'package:icook_mobile/ui/base_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../locator.dart';

class CreateDishModel extends BaseNotifier with Validators {
  final datasource = locator<DishDataSource>();
  final snack = locator<SnackbarService>();
  final nav = locator<NavigationService>();
  final key = locator<KeyStorageService>();
  StreamSubscription _resultSubscription;
  PickedFile file;
  final ImagePicker _picker = ImagePicker();
  List<File> files = [];
  String url = '';

  final dio = Dio();

  final api = locator<ApiService>();

  List<String> _ingredients = [];
  List<String> get ingredients => _ingredients;

  List<String> _images;
  // List<String> get images => _images;

//  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';

  List<String> _recipes = [];
  List<String> get recipes => _recipes;

  //scaffoldkey
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  //formkey
  final formkey = GlobalKey<FormState>();

  //Textcontroller
  final title = TextEditingController();
  final healthbenefits = TextEditingController();
  final ingre = TextEditingController();
  final steps = TextEditingController();

  Future<Map<String, dynamic>> _uploadImage(
      List<File> images, Map<dynamic, dynamic> body) async {
    print('seeeeeeeeeeeeeeeeeeeeeeeeeeeeee');

    Uri apiUrl = Uri.parse(ApiRoutes.postdish);

    Map<String, String> headers = {"Authorization": "${key.token}"};
    print(headers);

    // Intilize the multipart request
    final imageUploadRequest = http.MultipartRequest('POST', apiUrl);

    // Attach the file in the request

    // Explicitly pass the extension of the image with request body
    // Since image_picker has some bugs due which it mixes up
    // image extension with file name like this filenamejpge
    // Which creates some problem at the server side to manage
    // or verify the file extension

//    imageUploadRequest.fields['ext'] = mimeTypeData[1];
    imageUploadRequest.headers.addAll(headers);

    for (var image in images) {
      final mimeTypeData =
          lookupMimeType(image.path, headerBytes: [0xFF, 0xD8]).split('/');
      print(mimeTypeData);
      final file = await http.MultipartFile.fromPath('photos', image.path,
          contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
      imageUploadRequest.files.add(file);
    }

    print(body);

    imageUploadRequest.fields.addAll(body);
    print(imageUploadRequest.fields);

    // imageUploadRequest.fields['name'] = _name;
    // imageUploadRequest.fields['email'] = _email;
    // imageUploadRequest.fields['contact_no'] = _contact;

    try {
      final streamedResponse = await imageUploadRequest.send();
      final response = await http.Response.fromStream(streamedResponse);
      final Map<String, dynamic> responseData =
          json.decode(response.body) as Map<String, dynamic>;
      print(response.statusCode);
      // if (response.statusCode != 200) {
      //   return null;
      // }

      print(responseData);
      return responseData;
    } catch (e) {
      print(e);
      setState(ViewState.Idle);
      return null;
    }
  }

  Future<void> postDish() async {
    if (!formkey.currentState.validate() ||
        _recipes.length < 3 ||
        ingredients.length < 3 ||
        files.length < 1) {
      showSnack('Requirements not complete');
      return;
    }
    setState(ViewState.Busy);
    List<String> health = [];
    health.add(healthbenefits.text);

    final newBody = <String, String>{
      "name": title.text,
      "ingredients": jsonEncode(ingredients),
      "recipe": jsonEncode(recipes),
      "healthBenefits": jsonEncode(health)
    };

    print(newBody);

    final gather = await _uploadImage(files, newBody);
    print("mapppp $gather");
    final status = gather['status'];
    if (status == 'success') {
      setState(ViewState.Idle);
      //show
      dispose();
      final snackbar = SnackBar(content: Text('Dish sent successfully'));
      scaffoldKey.currentState.showSnackBar(snackbar);
    } else {
      setState(ViewState.Idle);
    }
  }

  void addIngredient() {
    if (ingre.text.isNotEmpty) {
      _ingredients.add(ingre.text);
      ingre.clear();
      notifyListeners();
    }
  }

  void addStep() {
    if (steps.text.isNotEmpty) {
      _recipes.add(steps.text);
      steps.clear();
      notifyListeners();
    }
  }

  void removeStep(int index) {
    print(index);
    if (_recipes.isNotEmpty) {
      _recipes.removeAt(index);
      notifyListeners();
    }
  }

  void removeIngredient(int index) {
    print(index);
    if (_ingredients.isNotEmpty) {
      _ingredients.removeAt(index);
      notifyListeners();
    }
  }

  void showSnack(String message) {
    snack.showCustomSnackBar(
        message: message,
        title: 'iCook_bot',
        instantInit: true,
        duration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _resultSubscription?.cancel();
    title.clear();
    healthbenefits.clear();
    ingre.clear();
    steps.clear();
    files.clear();
    _recipes.clear();
    _ingredients.clear();
  }

  Future<void> chooseImage() async {
    final pickedFile = await _picker.getImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      maxHeight: 600,
      imageQuality: 100,
    );

    print(pickedFile.path);
    files.add(File(pickedFile.path));
    notifyListeners();
    print(files);
  }

  void uploadImage() {
    setState(ViewState.Busy);

    final body = <dynamic, dynamic>{};

    if (files.length > 0) {
      try {
        final response =
            api.postHttpForm(ApiRoutes.uploadprofile, body, files, "photo");

        print(response);
      } catch (e) {}
    }
  }
}
