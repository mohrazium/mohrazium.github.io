part of common.serializers;
class DateTimeEpochConverter {
  const DateTimeEpochConverter();

  static DateTime fromJson(int json) =>
      DateTime.fromMillisecondsSinceEpoch(json);

  static int toJson(DateTime object) => object.millisecondsSinceEpoch;

  static DateTime? fromJsonNullable(int? json) =>
      json != null ? DateTime.fromMillisecondsSinceEpoch(json) : null;

  static int? toJsonNullable(DateTime? object) =>
      object?.millisecondsSinceEpoch;
}
