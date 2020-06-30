import 'dart:io';

import 'package:dio/dio.dart';
import 'package:icook_mobile/core/exceptions/network_exception.dart';
import 'package:icook_mobile/core/services/Api/ApiService.dart';
import 'package:icook_mobile/core/utils/file_helper.dart';

import 'package:icook_mobile/core/utils/network_utils.dart' as network_utils;
import 'package:http/http.dart' as http;

import '../../../locator.dart';

/// Helper service that abstracts away common HTTP Requests
class ApiServiceImpl implements ApiService {
  final _fileHelper = locator<FileHelper>();

  final _dio = Dio();

  @override
  Future<dynamic> getHttp(String route) async {
    Response response;

    print('Sending GET to $route');

    try {
      final fullRoute = '$route';
      response = await _dio.get(
        fullRoute,
        options: Options(
          contentType: 'application/json',
        ),
      );
    } on DioError catch (e) {
      print('ApiService: Failed to GET ${e.message}');
      throw NetworkException(e.message);
    }

    network_utils.checkForNetworkExceptions(response);
    //network_utils.responseHandler(response);

    // For this specific API its decodes json for us
    return response.data;
  }

  @override
  Future<dynamic> postHttp(String route, dynamic body) async {
    Response response;

    print('Sending $body to $route');

    try {
      final fullRoute = '$route';
      response = await _dio.post(
        fullRoute,
        data: body,
        onSendProgress: network_utils.showLoadingProgress,
        onReceiveProgress: network_utils.showLoadingProgress,
        options: Options(
          contentType:
              ContentType.parse("application/x-www-form-urlencoded").toString(),
        ),
      );
    } on DioError catch (e) {
      print('HttpService: Failed to POST ${e.message}');
      throw NetworkException(e.message);
    }

    network_utils.checkForNetworkExceptions(response);
    //network_utils.responseHandler(response);

    // For this specific API its decodes json for us
    return response.data;
  }

  @override
  Future<dynamic> postHttpForm(
    String route,
    Map<String, dynamic> body,
    List<File> files,
  ) async {
    int index = 0;

    final formData = FormData.fromMap(body);
    files?.forEach((file) async {
      final mFile = await _fileHelper.convertFileToMultipartFile(file);
      formData.files.add(MapEntry('file$index', mFile));
      index++;
    });

    final data = await postHttp(route, formData);

    return data;
  }

  @override
  Future<File> downloadFile(String fileUrl) async {
    Response response;

    final file = await _fileHelper.getFileFromUrl(fileUrl);

    try {
      response = await _dio.download(
        fileUrl,
        file.path,
        onReceiveProgress: network_utils.showLoadingProgress,
      );
    } on DioError catch (e) {
      print('HttpService: Failed to download file ${e.message}');
      throw NetworkException(e.message);
    }

    network_utils.checkForNetworkExceptions(response);
    //network_utils.responseHandler(response);

    return file;
  }

  Future<dynamic> gett(String url, header) async {
    print('Api Get, url $url');
    var responseJson;
    try {
      final response = await http.get(url, headers: header);
      responseJson = await network_utils.responseHandler(response);
    } on SocketException {
      print('No net');
      throw NetworkException('No internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic header, dynamic body) async {
    print('Api Post, url $url');
    var responseJson;
    try {
      final response = await http.post(url, headers: header, body: body);
      responseJson = await network_utils.responseHandler(response);
    } on SocketException {
      print('No net');
      throw ('No Internet connection');
    }
    print('api post.');
    return responseJson;
  }

  Future<dynamic> put(String url, dynamic header, dynamic body) async {
    print('Api Put, url $url');
    var responseJson;
    try {
      final response = await http.put(url, headers: header, body: body);
      responseJson = await network_utils.responseHandler(response);
    } on SocketException {
      print('No net');
      throw NetworkException('No internet connection');
    }
    print('api put.');
    return responseJson;
  }

  Future<dynamic> delete(String url, dynamic header) async {
    print('Api delete, url $url');
    var responseJson;
    try {
      final response = await http.delete(url, headers: header);
      responseJson = await network_utils.responseHandler(response);
    } on SocketException {
      print('No net');
      throw NetworkException('No internet connection');
    }
    print('api delete.');
    return responseJson;
  }

  @override
  void dispose() {
    _dio.clear();
    _dio.close(force: true);
  }

  @override
  Future<dynamic> patch(String url, dynamic header, dynamic body) async {
    print('Api patch, url $url , $header , $body');
    var responseJson;
    try {
      final response = await http.patch(url, headers: header, body: body);
      responseJson = await network_utils.responseHandler(response);
    } on SocketException {
      print('No net');
      throw NetworkException('No internet connection');
    }
    print('api patch.');
    return responseJson;
  }
}
