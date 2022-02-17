class NetworkException implements Exception {
  final String message;

  final String? data;

  NetworkException({required this.message, required this.data});
}
