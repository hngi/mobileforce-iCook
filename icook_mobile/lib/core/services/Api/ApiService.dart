import 'dart:io';

abstract class ApiService {
  /// Send GET request to endpoint/[route] and return the `response`
  /// - if successful: returns decoded json data
  ///
  /// - throws `NetworkException` if GET fails
  Future<dynamic> getHttp(String route);

  /// Send POST request with [body] to endpoint/[route] and return the `response`
  /// - if successful: returns decoded json data
  ///
  /// - throws `NetworkException` if POST request fails
  Future<dynamic> postHttp(String route, dynamic body);

  /// Send POST request with [files] to endpoint/[route] and return the `response`
  /// - if successful: returns decoded json data
  ///
  /// - throws `NetworkException` if posting form fails
  Future<dynamic> postHttpForm(
    String route,
    Map<String, dynamic> body,
    List<File> files,
  );

  /// Download file from [fileUrl] and return the File
  ///
  /// - throws `NetworkException` if file download fails
  Future<File> downloadFile(String fileUrl);

  Future<dynamic> gett(String url, header);
  Future<dynamic> post(String url, dynamic header, dynamic body);
  Future<dynamic> put(String url, dynamic header, dynamic body);
  Future<dynamic> delete(String url, dynamic header);

  Future<dynamic> patch(String url, dynamic header, dynamic body);

  void dispose();
}
