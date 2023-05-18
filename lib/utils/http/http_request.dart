import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_video/utils/http/https_proxy.dart';

import 'http_interceptor.dart';
import 'http_options.dart';

// http 请求单例类
class Http {
  // 初始化一个单例实例
  static final Http _instance = Http._internal();
  // 工厂构造方法，当你需要构造函数不是每次都创建一个新的对象时，使用factory关键字。
  factory Http() => _instance;
  // dio 实例
  late Dio dio;

  // 内部构造方法
  Http._internal() {
    // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpOptions().baseUrl,
      connectTimeout: HttpOptions().connectTimeout,
      receiveTimeout: HttpOptions().receiveTimeout,
      headers: HttpOptions().header,
      responseType: HttpOptions().responseType,
      contentType: HttpOptions().contentType,
    );

    dio = Dio(baseOptions);
    dio.interceptors.add(HttpInterceptor()); // 添加拦截器,还可以继续添加其他拦截器
    HttpsProxy(dio);
  }

  //* 初始化公共属性 如果需要覆盖原配置项 就调用它
  // [baseUrl] 地址前缀
  // [connectTimeout] 连接超时赶时间
  // [receiveTimeout] 接收超时赶时间
  // [headers] 请求头
  // [interceptors] 基础拦截器
  void init({
    String? baseUrl,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Map<String, dynamic>? headers,
    List<Interceptor>? interceptors,
  }) {
    if (baseUrl != null) dio.options.baseUrl = baseUrl;
    if (connectTimeout != null) dio.options.connectTimeout = connectTimeout;
    if (receiveTimeout != null) dio.options.receiveTimeout = receiveTimeout;
    if (headers != null) dio.options.headers = headers;
    if (interceptors != null) dio.interceptors.addAll(interceptors);
  }

  // * 设置请求头
  void setHeaders(Map<String, dynamic> headers) {
    dio.options.headers.addAll(headers);
  }

  // * 取消请求:
  // 同一个cancel token 可以用于多个请求
  // 当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
  // 所以参数可选
  // final CancelToken _cancelToken = CancelToken();
  // 取消时创建 CancelToken()
  void cancelRequests({required CancelToken token}) {
    token.cancel("cancelled");
  }

  // 设置鉴权请求头
  Options setAuthorizationHeader(Options? requestOptions) {
    requestOptions ??= Options();

    String token = '';
    if (token.isNotEmpty) {
      requestOptions.headers!['token'] = 'Bearer $token';
    }
    return requestOptions;
  }

  // restful get 操作
  Future get(String path, {Map<String, dynamic>? params, Options? options, CancelToken? cancelToken}) async {
    Options requestOptions = setAuthorizationHeader(options);

    Response response = await dio.get(
      path,
      queryParameters: params,
      options: requestOptions,
      cancelToken: cancelToken,
    );

    return response.data;
  }

  // restful post 操作
  Future post(String path, {dynamic data, Options? options, CancelToken? cancelToken}) async {
    Options requestOptions = setAuthorizationHeader(options);

    Response response = await dio.post(
      path,
      data: data,
      options: requestOptions,
      cancelToken: cancelToken,
    );

    return response.data;
  }

  // restful put 操作
  Future put(String path, {dynamic data, Options? options, CancelToken? cancelToken}) async {
    Options requestOptions = setAuthorizationHeader(options);

    Response response = await dio.put(
      path,
      data: data,
      options: requestOptions,
      cancelToken: cancelToken,
    );

    return response.data;
  }

  // restful patch 操作
  Future patch(String path, {dynamic data, Options? options, CancelToken? cancelToken}) async {
    Options requestOptions = setAuthorizationHeader(options);

    Response response = await dio.patch(
      path,
      data: data,
      options: requestOptions,
      cancelToken: cancelToken,
    );

    return response.data;
  }

  // restful patch 操作
  Future delete(String path, {dynamic data, Options? options, CancelToken? cancelToken}) async {
    Options requestOptions = setAuthorizationHeader(options);

    Response response = await dio.delete(
      path,
      data: data,
      options: requestOptions,
      cancelToken: cancelToken,
    );

    return response.data;
  }

  // restful patch 操作
  Future head(String path, {dynamic data, Options? options, CancelToken? cancelToken}) async {
    Options requestOptions = setAuthorizationHeader(options);

    Response response = await dio.head(
      path,
      data: data,
      options: requestOptions,
      cancelToken: cancelToken,
    );

    return response.data;
  }

  // restful post form 表单提交操作
  Future postForm(String path, {required Map<String, dynamic> params, Options? options, CancelToken? cancelToken}) async {
    Options requestOptions = setAuthorizationHeader(options);

    Response response = await dio.post(
      path,
      data: FormData.fromMap(params),
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  // 下载文件
  downLoadFile(
    path,
    savePath, {
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    data,
    Options? options,
  }) async {
    Options requestOptions = setAuthorizationHeader(options);
    requestOptions.responseType = ResponseType.bytes;
    requestOptions.validateStatus = (status) {
      return status! < 500;
    };

    Response? response = await dio.download(
      path,
      savePath,
      onReceiveProgress: (int count, int total) {
        debugPrint('$count $total');
      },
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      data: data,
      options: options,
    );
    return response;
  }
}
