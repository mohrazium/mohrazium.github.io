// ignore_for_file: body_might_complete_normally_nullable

import 'package:persian_tools/persian_tools.dart';

import 'date_converter_mixin.dart';

/// use this mixin for all form field
mixin ValidatorMixin {
  String? nationalIdentityValidator(
      {var translator, required String? value, String? errorMessage}) {
    if (value!.isEmpty) {
      return errorMessage ?? translator.notValidNationalIdentity ?? "Not valid national identity.";
    } else if (!verifyIranianNationalId(value)) {
      return errorMessage;
    }
  }

  String? requiredFieldValidator({var translator, required String? value, String? errorMessage}) {
    if (value!.isEmpty) {
      return errorMessage ?? translator.isRequiredField ?? "Field is required.";
    }
    return null;
  }

  String? beforeTodayValidator({var translator, required String? value, String? errorMessage}) {
    try {
      DateTime date = DateConverter.toDateTime(shamsiDate: value);
      if (!date.isBefore(DateTime.now())) {
        return errorMessage ?? translator.isNotBeforeToday ?? "Date is not before today.";
      }
    } catch (ignore) {
      return null;
    }
  }

  String? mobileNumberValidator({var translator, required String? value, String? errorMessage}) {
    if (value!.isEmpty) {
      return translator.isRequiredField ?? "Field is required.";
    } else {
      if (!phoneNumberValidator(value)) {
        return errorMessage ?? translator.notValidPhoneNumber ?? "Phone number is not valid.";
      }
    }
  }

  String? dateValidator(
      {var translator, bool isRequired = false, required String? value, String? errorMessage}) {
    final requiredFieldError = isRequired ? requiredFieldValidator(value: value) : null;
    if (requiredFieldError == null) {
      RegExp dateRegExp = RegExp(
        r"[0-9]{4}/[0-9]{2}/[0-9]{2}",
        caseSensitive: false,
        multiLine: false,
      );
      if (dateRegExp.hasMatch(value!)) {
        var splitDate = (value.split("/"));
        if (int.parse(splitDate[0]) > 1450) {
          return translator.yearNotValid ?? "Year is not valid.";
        } else if (int.parse(splitDate[1]) > 12) {
          return translator.monthNotValid ?? "Month is not valid.";
        } else if (int.parse(splitDate[2]) > 31) {
          return translator.dayNotValid ?? "Day is not valid.";
        }
      }
      return requiredFieldError;
    }
    return requiredFieldError;
  }

  String? endDateAfterStartDateValidator(
      {var translator,
      bool isRequired = false,
      required String? startDate,
      required String? endDate}) {
    final validDateError = dateValidator(isRequired: isRequired, value: endDate);

    if (validDateError == null) {
      try {
        DateTime start = DateConverter.toDateTime(shamsiDate: startDate);
        DateTime end = DateConverter.toDateTime(shamsiDate: endDate);
        if (end.isAfter(start) || end.isAtSameMomentAs(start)) {
          return null;
        } else {
          return translator.notValidDate ?? "Date is not valid";
        }
      } catch (e) {
        //ignore
      }
    } else {
      return validDateError;
    }
  }
}
