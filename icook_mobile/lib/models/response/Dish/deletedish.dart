import 'dart:convert';

class DeleteDIshResponse {
  final String status;
  final String error;
  final Data data;
  DeleteDIshResponse({
    this.status,
    this.error,
    this.data,
  });

  DeleteDIshResponse copyWith({
    String status,
    String error,
    Data data,
  }) {
    return DeleteDIshResponse(
      status: status ?? this.status,
      error: error ?? this.error,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'error': error,
      'data': data?.toMap(),
    };
  }

  static DeleteDIshResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return DeleteDIshResponse(
      status: map['status'],
      error: map['error'],
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  static DeleteDIshResponse fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() =>
      'DeleteDIshResponse(status: $status, error: $error, data: $data)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is DeleteDIshResponse &&
        o.status == status &&
        o.error == error &&
        o.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ error.hashCode ^ data.hashCode;
}

class Data {
  toMap() {}

  static fromMap(map) {}
}
