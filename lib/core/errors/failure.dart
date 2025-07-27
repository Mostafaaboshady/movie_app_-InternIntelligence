// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:developer';

import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioExaption(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'connection out with api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'send out with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'receive out with api server');
      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: ' bad certificate ');
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'canceled with api server');
      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: 'try connect internet');
      case DioExceptionType.unknown:
        return ServerFailure(errMessage: 'errors unknown , please try later');

      default:
        return ServerFailure(
            errMessage: 'Oops there was an errors  , pleae try later');
    }
  }

  factory ServerFailure.fromBadResponse(int statuCode, dynamic response) {
    if (statuCode == 400 ||
        statuCode == 401 ||
        statuCode == 403 ||
        statuCode == 34 ||
        statuCode == 7) {
      return ServerFailure(errMessage: response['status_message']);
    } else if (statuCode == 500)
      return ServerFailure(
          errMessage: 'Enternel server error please try agains');
    else
      log(statuCode.toString());
    return ServerFailure(
        errMessage: 'Oops there was an errors  , pleae try again');
  }
}
