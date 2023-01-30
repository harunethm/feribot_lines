import 'package:feribot_lines/models/others/key_value_model.dart';

class Validation {
  static String? nameValidation({
    required String text,
  }) {
    return text.isEmpty ? "Alan boş bırakılamaz." : null;
  }

  static String? surNameValidation({
    required String text,
  }) {
    return text.isEmpty ? "Alan boş bırakılamaz." : null;
  }

  static String? passwordValidation({
    required String text,
  }) {
    return text.isEmpty
        ? "Alan boş bırakılamaz."
        : text.length < 4
            ? "Şifre en az 4 haneli olmalı."
            : null;
  }

  static String? passportNumberValidation({
    required String text,
  }) {
    return text.isEmpty ? "Alan boş bırakılamaz." : null;
  }

  static String? identificationNumberValidation({
    required String text,
  }) {
    return text.isEmpty ? "Alan boş bırakılamaz." : null;
  }

  static String? phoneNumberValidation({
    required String text,
  }) {
    return text.isEmpty ? "Alan boş bırakılamaz." : null;
  }

  static String? eMailValidation({
    required String text,
  }) {
    return text.isEmpty ? "Alan boş bırakılamaz." : null;
  }
}
