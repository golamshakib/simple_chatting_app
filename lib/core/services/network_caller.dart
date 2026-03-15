import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:simple_chatting_app/core/utils/helpers/app_helper.dart';
import '../models/response_data.dart';
import '../utils/logging/logger.dart';
import 'auth_service.dart';

class NetworkCaller {
  final int timeoutDuration = 10;

  Future<ResponseData> getRequest(String endpoint, {String? token, bool showSuccessSnackbar = true, bool showErrorSnackbar = true}) async {
    AppLoggerHelper.info('GET Request: $endpoint');
    try {
      final Response response = await get(
        Uri.parse(endpoint),
        headers: {
          'Authorization': token ?? "Bearer ${AuthService.token.toString()}",
          'Content-type': 'application/json',
        },
      ).timeout(Duration(seconds: timeoutDuration));
      return _handleResponse(response, showSuccessSnackbar, showErrorSnackbar);
    } catch (e) {
      return _handleError(e, showErrorSnackbar);
    }
  }

  Future<ResponseData> postRequest(String endpoint,
      {Map<String, dynamic>? body, String? token, bool showSuccessSnackbar = true, bool showErrorSnackbar = true}) async {
    AppLoggerHelper.info('POST Request: $endpoint');
    AppLoggerHelper.info('Request Body: ${jsonEncode(body.toString())}');

    try {
      final Response response = await post(
        Uri.parse(endpoint),
        headers: {
          'Authorization': token ?? "Bearer ${AuthService.token.toString()}",
          'Content-type': 'application/json',
        },
        body: jsonEncode(body),
      ).timeout(Duration(seconds: timeoutDuration));
      return _handleResponse(response, showSuccessSnackbar, showErrorSnackbar);
    } catch (e) {
      return _handleError(e, showErrorSnackbar);
    }
  }

  Future<ResponseData> putRequest(String endpoint,
      {Map<String, dynamic>? body, String? token, bool showSuccessSnackbar = true, bool showErrorSnackbar = true}) async {
    AppLoggerHelper.info('PUT Request: $endpoint');
    AppLoggerHelper.info('Request Body: ${jsonEncode(body.toString())}');

    try {
      final Response response = await put(
        Uri.parse(endpoint),
        headers: {
          'Authorization': token ?? "Bearer ${AuthService.token.toString()}",
          'Content-type': 'application/json',
        },
        body: jsonEncode(body),
      ).timeout(Duration(seconds: timeoutDuration));
      return _handleResponse(response, showSuccessSnackbar, showErrorSnackbar);
    } catch (e) {
      return _handleError(e, showErrorSnackbar);
    }
  }

  Future<ResponseData> patchRequest(String endpoint, {
    Map<String, dynamic>? body,
    String? token,
    bool showSuccessSnackbar = true,
    bool showErrorSnackbar = true,
  }) async {
    AppLoggerHelper.info('PATCH Request: $endpoint');
    AppLoggerHelper.info('Request Body: ${jsonEncode(body)}');

    try {
      final Response response = await patch(
        Uri.parse(endpoint),
        headers: {
          'Authorization': token ?? "Bearer ${AuthService.token.toString()}",
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      ).timeout(Duration(seconds: timeoutDuration));

      return _handleResponse(response, showSuccessSnackbar, showErrorSnackbar);
    } catch (e) {
      return _handleError(e, showErrorSnackbar);
    }
  }

  Future<ResponseData> deleteRequest(String endpoint, String? token, {bool showSuccessSnackbar = true, bool showErrorSnackbar = true}) async {
    AppLoggerHelper.info('DELETE Request: $endpoint');
    try {
      final Response response = await delete(
        Uri.parse(endpoint),
        headers: {
          'Authorization': token ?? "Bearer ${AuthService.token.toString()}",
          'Content-type': 'application/json',
        },
      ).timeout(Duration(seconds: timeoutDuration));
      return _handleResponse(response, showSuccessSnackbar, showErrorSnackbar);
    } catch (e) {
      return _handleError(e, showErrorSnackbar);
    }
  }

  // Handle the response from the server
  Future<ResponseData> _handleResponse(http.Response response, bool showSuccessSnackbar, bool showErrorSnackbar) async {
    AppLoggerHelper.info('Response Status: ${response.statusCode}');
    AppLoggerHelper.info('Response Body: ${response.body}');

    dynamic decodedResponse;

    try {
      decodedResponse = jsonDecode(response.body);
    } catch (e) {
      decodedResponse = response.body;
    }
    switch (response.statusCode) {
      /// SUCCESS
      case 200:
      case 201:
        if(showSuccessSnackbar && decodedResponse is Map && decodedResponse ['message'] != null){
         AppHelperFunctions.showSnackBar(decodedResponse['message']);
        }
        return ResponseData(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodedResponse,
          errorMessage: '',
        );
        /// NO CONTENT
      case 204:
        if (showSuccessSnackbar) AppHelperFunctions.showSnackBar("Request successful");
        return ResponseData(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodedResponse,
          errorMessage: '',
        );
        /// BAD REQUEST
      case 400:
        String message = decodedResponse['message'] ?? decodedResponse['error'] ?? "Bad request";
        if (showErrorSnackbar) AppHelperFunctions.showSnackBar(message);
        return ResponseData(
          isSuccess: false,
          statusCode: response.statusCode,
          responseData: decodedResponse,
          errorMessage: message,
        );
        /// UNAUTHORIZED
      case 401:
        await AuthService.logoutUser();
        String message = decodedResponse['message'] ?? "Session expired. Please login again.";
        if (showErrorSnackbar) AppHelperFunctions.showSnackBar(message);
        return ResponseData(
          isSuccess: false,
          statusCode: response.statusCode,
          responseData: decodedResponse,
          errorMessage: message,
        );
        /// FORBIDDEN
      case 403:
        String message = decodedResponse['message'] ?? "You don't have permission to access this resource.";
        if (showErrorSnackbar) AppHelperFunctions.showSnackBar(message);
        return ResponseData(
          isSuccess: false,
          statusCode: response.statusCode,
          responseData: decodedResponse,
          errorMessage: message,
        );
          /// NOT FOUND
      case 404:
        String message = decodedResponse['message'] ?? "Requested resource not found.";
        if (showErrorSnackbar) AppHelperFunctions.showSnackBar(message);
        return ResponseData(
          isSuccess: false,
          statusCode: response.statusCode,
          responseData: decodedResponse,
          errorMessage: message,
        );
        /// INTERNAL SERVER ERROR
      case 500:
        String message = decodedResponse['message'] ?? "Internal server error. Please try again later.";
        if (showErrorSnackbar) AppHelperFunctions.showSnackBar(message);
        return ResponseData(
          isSuccess: false,
          statusCode: response.statusCode,
          responseData: decodedResponse,
          errorMessage: message,
        );
        /// DEFAULT CASE FOR OTHER STATUS CODES
      default:
        String message = decodedResponse is Map
            ? decodedResponse['message'] ??
            decodedResponse['error'] ??
            "Something went wrong."
            : "Unexpected error occurred.";
        if (showErrorSnackbar) AppHelperFunctions.showSnackBar(message);

        return ResponseData(
          isSuccess: false,
          statusCode: response.statusCode,
          responseData: decodedResponse,
          errorMessage: message,
        );
    }
  }
}

// Handle errors during the request process
ResponseData _handleError(dynamic error, bool showErrorSnackbar) {
  log('Request Error: $error');

  String message = "Unexpected error occurred. Please try again later.";
  int statusCode = 500;

  if (error is TimeoutException) {
    message =
    "Request timeout. Please check your internet connection and try again.";
    statusCode = 408;
  }

  else if (error is http.ClientException) {
    message =
    "Network error occurred. Please check your internet connection.";
    statusCode = 503;
  }

  else if (error.toString().contains("SocketException")) {
    message = "No internet connection. Please check your network.";
    statusCode = 503;
  }

  if (showErrorSnackbar) AppHelperFunctions.showSnackBar(message);

  return ResponseData(
    isSuccess: false,
    statusCode: statusCode,
    errorMessage: message,
    responseData: null,
  );
}
