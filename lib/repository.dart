import 'package:dio/dio.dart';
import 'package:coven/uitls/app_http.dart';

class Repository extends AppHttp {
  Future sendTokenFCMAPI(FormData formData) async {
    Map<String, dynamic> header = await this.getHeader();
    try {
      await http.post( await this.getUrlApi() + 'devices',
          data: formData, options: Options(headers: header));

    } on DioError catch (e) {
      print(e.response);
    }
  }
}
