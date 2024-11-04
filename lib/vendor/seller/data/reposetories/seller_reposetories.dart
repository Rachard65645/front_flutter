import 'package:gas/vendor/seller/data/model/seller_model.dart';
import 'package:gas/vendor/seller/data/services/seller_service.dart';

class SellerReposetories {
  final SellerService service;

  SellerReposetories({required this.service});

  Future<SellerModel> getSellerById({required String id}) async {
    final data = await service.getSellerById(id: id);
    return SellerModel.fromJson(data['Sellers']);
  }

  Future<SellerModel> createSeller(
      {required String cni,
      required String rccm,
      required String patente,
      required String cc}) async {
    final data = await service.createSeller(
        cni: cni,
        rccm: rccm,
        patente: patente,
        cc: cc
        );
    return SellerModel.fromJson(data);
  }

  Future<SellerModel> validateSeller({required String id}) async {
    final data = await service.validateSeller(id: id);
    return data;
  }

  Future<SellerModel> refuseSeller({required String id}) async {
    final data =  await service.refuseSeller(id: id);
    return data;
  }

  Future<SellerModel> deleteSeller({required String id}) async {
    final data = await service.deleteSeller(id: id);
    return data;
  }
}
