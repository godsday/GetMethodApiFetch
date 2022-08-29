import 'package:api_learning/models/useer_data_model.dart';
import 'package:dio/dio.dart';

class API {
  String baseURL = 'https://reqres.in/api/users';

  Future<UserDataModel?> getUer() async {
    try {
      Response response = await Dio().get(baseURL);
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        return UserDataModel.fromJson(response.data);
      } else {
        return UserDataModel(message: 'Give the error message from API');
      }
    } catch (e) {
      // log('LoginAPI catch => ${e.toString()}');
      // use log if you are running in run with debug

      // use debugPrint if you are running in run without debug
      // debugPrint('LoginAPI catch => ${e.toString()}');

      if (e is DioError) {
        if (e.response?.data == null) {
          return UserDataModel(message: 'Something went wrong!');
        }
        return UserDataModel(
          message: e.response!.data['message'],
        );
      } else {
        return UserDataModel(message: e.toString());
      }
    }
  }
}
