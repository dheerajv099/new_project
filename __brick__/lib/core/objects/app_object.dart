abstract class AppObject<T> {
  // T fromMap(dynamic json);

  Map<String, dynamic> toMap();
}

abstract class DataObject<T> extends AppObject<T>{
  /// result = true means status as success else status as error
  final bool result;
  final ObjectStatus status;
  final String? message;

  DataObject({
    this.message,
    this.result = false,
    this.status = ObjectStatus.error,
  }) : assert(
          result && status == ObjectStatus.success ||
              !result && status == ObjectStatus.error,
        );
}

enum ObjectStatus {
  success,
  error;

  static ObjectStatus fromString(String value) {
    return ObjectStatus.values.firstWhere(
      (status) => status.name == value,
      orElse: () => ObjectStatus.error,
    );
  }
}
