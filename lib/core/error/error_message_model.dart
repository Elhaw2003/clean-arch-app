class ErrorMessageModel {
  final int? statusCode;        // خليه nullable
  final String? statusMessage;  // خليه nullable
  final bool success;

  ErrorMessageModel({
    this.statusCode,
    this.statusMessage,
    required this.success,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusCode: json['status_code'] is int ? json['status_code'] : null,
      statusMessage: json['status_message']?.toString(),
      success: json['success'] ?? false,
    );
  }
}
