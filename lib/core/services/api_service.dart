import 'package:clinic_booking_app/core/services/api_endpoints.dart';
import 'package:dio/dio.dart';

class ApiService{
  final Dio dio;

  ApiService( this.dio);

  Future<dynamic> get({required String endPoint}) async{
    Response response = await dio.get(
      '${ApiEndpoints.baseUrl}/$endPoint'
    );
     return response.data;
  }
}