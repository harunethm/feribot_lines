class ResponseModel {
  final bool error;
  final String errorMessage;
  final dynamic data;
  ResponseModel({
    required this.error,
    required this.errorMessage,
    required this.data,
  });
}
