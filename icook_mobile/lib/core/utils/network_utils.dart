import 'dart:convert' as convert;

import 'package:dio/dio.dart';
import 'package:icook_mobile/core/exceptions/network_exception.dart';
import 'package:icook_mobile/models/api_error_model.dart';

void checkForNetworkExceptions(Response response) {
  if (response.statusCode != 200) {
    throw NetworkException('Failed to connect to internet');
  }
}

void showLoadingProgress(received, total) {
  if (total != -1) {
    print('${(received / total * 100).toStringAsFixed(0)}%');
  }
}

dynamic decodeResponsedataToJson(String reponse) {
  try {
    final data = convert.jsonDecode(reponse);
    return data;
  } on FormatException catch (e) {
    print('Network Utils: Failed to decode response data ${e.message}');
    throw NetworkException(e.message);
  }
}

dynamic responseHandler(Response response) async {
  switch (response.statusCode) {
    case 201:
    case 200:
      print(['200/201 >>', response.data]);
      return response.data;
      break;
    case 400:
      print(['400 >>', response.data]);
      final error = apiErrorModelFromJson(response.data);
      throw (error.error);
      break;
    case 401:
      print(['401 >>', response.data]);
      final error = apiErrorModelFromJson(response.data);
      throw (error.error);
      break;
    case 403:
      print(['403 >>', response.data]);
      final error = apiErrorModelFromJson(response.data);
      throw (error.error);
      break;
    case 404:
      print(['404 >>', response.data]);
      final error = apiErrorModelFromJson(response.data);
      throw (error.error);
      break;
    case 409:
      print(['409 >>', response.data]);
      final error = apiErrorModelFromJson(response.data);
      throw (error.error);
      break;
    case 500:
    default:
      print(['500 >>', response.data]);
      final error = apiErrorModelFromJson(response.data);
      throw (error.error);
      break;
  }
}
