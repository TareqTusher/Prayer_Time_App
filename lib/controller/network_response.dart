class NetworkResponse {
  String? errorMessage;
  bool isSuccess;
  final int statusCode;
  final dynamic jsonResponse;

  NetworkResponse({
    this.errorMessage,
    required this.isSuccess,
    this.jsonResponse,
    this.statusCode = -1,
  });
}
