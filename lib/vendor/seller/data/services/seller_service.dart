import 'package:dio/dio.dart';

class SellerService {
  final Dio http;

  SellerService({
    required this.http,
  });

  Future<dynamic> getSellerById({required String id}) async {
    final response = await http.get('/seller/$id');
    return response.data;
  }

  Future<dynamic> createSeller(
      {required String cni,
      required String rccm,
      required String patente,
      required String cc}) async {
    final response = await http.post('/seller/add', data: {
      'CNI': cni,
      'RCCM': rccm,
      'Patente': patente,
      'CC': cc,
    });
    return response.data;
  }


  Future<dynamic> validateSeller({required String id}) async {
    final response = await http.patch('/seller/validate/$id');
    return response.data;
  }

  Future<dynamic> refuseSeller({required String id}) async {
    final response = await http.patch('/seller/refuse/$id');
    return response.data;
  }

  Future<dynamic> deleteSeller({required String id}) async {
    final response = await http.delete('/seller/delete/$id');
    return response.data;
  }
}
