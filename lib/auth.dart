import 'dart:convert';

import 'package:dio/dio.dart';

class PowerCampusApi {
  final dio = Dio();
  String token = "";

  Future<String> getUniSessionId() async {
    try {
      final res = await dio.get("https://register.nu.edu.eg/PowerCampusSelfService/Search/Section");
      return res.headers["set-cookie"]![0].split(';')[0];
    } on DioException catch (error) {
      dio.close();
      if (error.response != null) {
        // writeError("getUniSessionId", "${error.response!.statusCode} - ${error.response!.data}");
      } else {
        // writeError("getUniSessionId", error);
      }
      return '';
    }
  }

  Future<void> getUniToken({required String username, required String password}) async {
    String url = "https://register.nu.edu.eg/PowerCampusSelfService/SignIn/Authenticate";
    try {
      dio.options.headers["Referer"] =
          "https://register.nu.edu.eg/PowerCampusSelfService/Home/LogIn?ReturnUrl=%2FPowerCampusSelfService%2F";
      Response response = await dio.post(url, data: {"username": username, "password": password});
      if (jsonDecode(response.data)["data"]["success"]) {
        token = response.headers["set-cookie"]![0].toString().split(" path=/;")[0];
      }
    } on DioException catch (error) {
      dio.close();
      if (error.response != null) {
        // writeError("getUniToken", "${error.response!.statusCode} - ${error.response!.data}");
      } else {
        // writeError("getUniToken", error);
      }
    }
  }

  Future<String> getUniPersonId() async {
    Response response;
    final Map<String, dynamic> responseJson;

    String url = "https://register.nu.edu.eg/PowerCampusSelfService/Advisees/0/warnings";

    try {
      dio.options.headers["cookie"] = token;
      dio.options.headers["Referer"] =
          "https://register.nu.edu.eg/PowerCampusSelfService/Account/Profile";
      response = await dio.get(url);
      responseJson = jsonDecode(response.data);
      if (responseJson["status"]) {
        return responseJson["data"]["personId"].toString();
      }
      return '';
    } on DioException catch (error) {
      dio.close();
      if (error.response != null) {
        // writeError("getUniPersonId", "${error.response!.statusCode} - ${error.response!.data}");
      } else {
        // writeError("getUniPersonId", error);
      }
      return '';
    }
  }

  Future<String> getUniTable(String personId, String year, String semester) async {
    String url = "https://register.nu.edu.eg/PowerCampusSelfService/Schedule/Student";

    try {
      dio.options.headers["cookie"] = token;
      dio.options.headers["Referer"] =
          "https://register.nu.edu.eg/PowerCampusSelfService/Registration/Schedule";
      final response = await dio.post(
        url,
        data: {
          "personId": personId,
          "yearTermSession": {"year": year, "term": semester},
        },
      );
      return response.data;
    } on DioException catch (error) {
      dio.close();
      if (error.response != null) {
        // writeError("getUniTable", "${error.response!.statusCode} - ${error.response!.data}");
      } else {
        // writeError("getUniTable", error);
      }
    }
    return "";
  }

  Future<String> getUniAdvisor() async {
    Response response;

    String url =
        "https://register.nu.edu.eg/PowerCampusSelfService/AcademicPlans/Default/undefined";

    try {
      dio.options.headers["cookie"] = token;
      dio.options.headers["Referer"] =
          "https://register.nu.edu.eg/PowerCampusSelfService/Registration/AcademicPlan";
      response = await dio.get(url);
      final responseJson = jsonDecode(response.data);
      return responseJson["data"]["email"];
    } on DioException catch (error) {
      dio.close();
      if (error.response != null) {
        // writeError("getUniAdvisor", "${error.response!.statusCode} - ${error.response!.data}");
      } else {
        // writeError("getUniAdvisor", error);
      }
    }
    return "";
  }

  Future<List> getAdvisees() async {
    Response response;

    String url = "https://register.nu.edu.eg/PowerCampusSelfService/Advisees/BasicSearch";

    try {
      dio.options.headers["cookie"] = token;
      dio.options.headers["Referer"] =
          "https://register.nu.edu.eg/PowerCampusSelfService/Advisees/BasicSearch";

      response = await dio.post(
        url,
        data: {"keyword": "", "length": 1000, "startIndex": 0, "view": 0},
      );

      final responseJson = jsonDecode(response.data);
      return responseJson["data"]["advisees"];
    } on DioException catch (error) {
      dio.close();
      if (error.response != null) {
        // writeError("getUniAdvisor", "${error.response!.statusCode} - ${error.response!.data}");
      } else {
        // writeError("getUniAdvisor", error);
      }
    }
    return [];
  }

  Future<List> getTranscript({required int studentId}) async {
    Response response;

    String url =
        "https://register.nu.edu.eg/PowerCampusSelfService/Students/UnofficialTranscripts/$studentId";

    try {
      dio.options.headers["cookie"] = token;
      dio.options.headers["Referer"] =
          "https://register.nu.edu.eg/PowerCampusSelfService/Advising/ManageAdvisees/0/AdviseeProfile/$studentId/0";

      response = await dio.get(url);

      final responseJson = jsonDecode(response.data);
      return responseJson["data"]["headerInformation"][0]["transcriptYearTerm"];
    } on DioException catch (error) {
      dio.close();
      if (error.response != null) {
        // writeError("getUniAdvisor", "${error.response!.statusCode} - ${error.response!.data}");
      } else {
        // writeError("getUniAdvisor", error);
      }
    }
    return [];
  }
}
