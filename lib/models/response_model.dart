class ResponseModel<T> {
  final bool error;
  final String errorMessage;
  final T data;
  ResponseModel({
    required this.error,
    required this.errorMessage,
    required this.data,
  });
}
