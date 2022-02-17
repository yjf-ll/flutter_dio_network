class NetworkRes {
  final int code;

  final String message;

  final dynamic data;

  NetworkRes({
    required this.code,
    required this.message,
    this.data,
  });

  factory NetworkRes.fromJson(Map<String, dynamic> map) => NetworkRes(
        code: int.tryParse('${map['code']}') ?? 0,
        message: '${map['message']}',
        data: map['data'],
      );
}
