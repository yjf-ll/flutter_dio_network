import 'package:dio/dio.dart';
import 'package:flutter_network/cache/cache.dart';
import 'package:flutter_network/network/network_config.dart';

class Network {
  final Dio dio;

  Network._({required this.dio});

  factory Network._create(Dio dio) => Network._(dio: dio);

  static Network? _client;

  static void init() {
    if (_client == null) {
      //  创建配置信息
      final BaseOptions options = BaseOptions(
        baseUrl: NetworkConfig.baseUrl,
        sendTimeout: NetworkConfig.sendTimeout,
        connectTimeout: NetworkConfig.connectTimeout,
        receiveTimeout: NetworkConfig.receiveTimeout,
      );

      //  创建dio实例，并且添加配置信息
      final Dio dio = Dio(options);

      //  对dio添加拦截器
      dio.interceptors.add(NetworkIntercept());

      //  创建network实例并保存
      _client = Network._create(dio);
    }
  }

  static Dio get instance => _client!.dio;
}

class NetworkIntercept extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String? token = AppCache.token;
    if (token != null) {
      options.headers['token'] = token;
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}
