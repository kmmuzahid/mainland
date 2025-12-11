// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:mainland/core/config/api/api_end_point.dart';
// import 'dio_service.dart';
// import 'request_input.dart';

// class DioRequestBuilder {
//   final DioService service;

//   DioRequestBuilder({required this.service});

//   /// Builds request options based on the provided input
//   Future<RequestOptions> build(RequestInput input) async {
//     // Get access token if required
//     final accessToken = input.requiresToken
//         ? service.authCubit?.state.userLoginInfoModel.accessToken
//         : null;

//     // Build URL
//     String url = _buildUrl(input);

//     // Prepare headers
//     final headers = _buildHeaders(input, accessToken);

//     // Prepare request body and content type
//     final (body, contentType) = await _buildBody(input);

//     // Create and return request options
//     return RequestOptions(
//       method: input.method.name,
//       path: url,
//       headers: headers,
//       queryParameters: input.queryParams,
//       data: body,
//       contentType: contentType,
//       extra: {'requiresToken': input.requiresToken, 'service': service},
//     );
//   }

//   String _buildUrl(RequestInput input) {
//     String url = input.endpoint;
//     if (!url.startsWith('http')) {
//       url = '${ApiEndPoint.instance.baseUrl}$url';
//     }

//     // Replace path parameters
//     if (input.pathParams != null) {
//       input.pathParams!.forEach((key, value) {
//         if (value != null) {
//           url = url.replaceAll('{$key}', Uri.encodeComponent(value.toString()));
//         }
//       });
//     }

//     return url;
//   }

//   Map<String, dynamic> _buildHeaders(RequestInput input, String? accessToken) {
//     final headers = <String, dynamic>{
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       if (input.requiresToken && accessToken?.isNotEmpty == true)
//         'Authorization': 'Bearer $accessToken',
//       ...?input.headers,
//     };

//     return headers;
//   }

//   Future<(dynamic body, String? contentType)> _buildBody(RequestInput input) async {
//     // Handle file uploads
//     if (input.files?.isNotEmpty == true || input.formFields != null) {
//       final formData = FormData();

//       // Add form fields
//       if (input.formFields != null) {
//         formData.fields.addAll(
//           input.formFields!.entries.map((e) => MapEntry(e.key, e.value ?? '')),
//         );
//       }

//       // Add JSON body if provided
//       if (input.jsonBody != null) {
//         formData.fields.add(MapEntry('data', jsonEncode(input.jsonBody)));
//       }

//       // Add files
//       if (input.files != null) {
//         for (final file in input.files!) {
//           if (file != null && file.path.isNotEmpty) {
//             formData.files.add(
//               MapEntry(file.field, await MultipartFile.fromFile(file.path, filename: file.name)),
//             );
//           }
//         }
//       }

//       return (formData, 'multipart/form-data');
//     }

//     // Handle JSON body
//     return (input.jsonBody, 'application/json');
//   }
// }
