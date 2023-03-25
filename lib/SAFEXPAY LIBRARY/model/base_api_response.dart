class BaseApiResponse {
  late ErrorDetails errorDetails;
}

class ErrorDetails {
  ErrorDetails({required this.errorCode, required this.errorMessage});

  ErrorDetails.fromJson(Map<String, dynamic> jsonMap) {
    errorCode = jsonMap['error_code'];
    errorMessage = jsonMap['error_message'];
  }

  late String errorCode;
  late String errorMessage;
}