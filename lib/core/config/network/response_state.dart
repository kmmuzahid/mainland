// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class ResponseState<T> {
  ResponseState({
    required this.data,
    required this.statusCode,
    this.isRequesting = false,
    this.message,
    this.cancelToken,
  });

  final T data;
  final bool isRequesting;
  final String? message;
  final CancelToken? cancelToken;
  final int? statusCode;

  ResponseState<T> copyWith({T? data, bool? isRequesting, String? error, CancelToken? cancelToken, int? responseCode}) {
    return ResponseState<T>(
      data: data ?? this.data,
      isRequesting: isRequesting ?? this.isRequesting,
      message: error ?? this.message,
      cancelToken: cancelToken ?? this.cancelToken,
      statusCode: responseCode ?? this.statusCode,
    );
  }
}
