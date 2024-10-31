import 'package:gas/vendor/seller/data/model/seller_model.dart';
import 'package:gas/vendor/sellers/data/services/sellers_service.dart';

class SellersReposetory {
  final SellersService service;

  SellersReposetory({required this.service});


  Future<List<SellerModel>> getSeller() async {
    final data = await service.getSeller();
    return (data['Sellers'] as List)
        .map((json) => SellerModel.fromJson(json))
        .toList();
  }
}
