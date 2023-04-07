// ignore_for_file: always_use_package_imports

import 'package:dio/dio.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../main/app_environment.dart';
import 'api_client.dart';

final apiClientProvider = Provider<ApiClient>(
  (ref) => ApiClient(
    ref.watch(
      dioProvider(EnvInfo.apiBaseUrl),
    ),
  ),
);

final dioProvider = Provider.family<Dio, String>((ref, baseUrl) => Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          'x-rapidapi-key':
              '7d72957525msh0a3476e8238d3c2p12c493jsne6832b801c90',
        },
      ),
    )..interceptors.addAll(
        [
          LoggyDioInterceptor(requestBody: true, requestHeader: true),
        ],
      ));
