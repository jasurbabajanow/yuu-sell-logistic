class ApiErrorResponse {
  final int statusCode;
  final String message;
  final String error;
  final String? timestamp;
  final String? path;

  const ApiErrorResponse({
    required this.statusCode,
    required this.message,
    required this.error,
    this.timestamp,
    this.path,
  });

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) {
    return ApiErrorResponse(
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? 'Unknown error',
      error: json['error'] ?? '',
      timestamp: json['timestamp'],
      path: json['path'],
    );
  }
}
