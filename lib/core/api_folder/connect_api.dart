import 'package:injectable/injectable.dart';

import '../connect_end/model/get_tenant_response_model/get_tenant_response_model.dart';
import '../connect_end/model/login_entity_model.dart';
import '../connect_end/model/login_response_model/login_response_model.dart';
import '../connect_end/model/update_pharmacy_profile_entity_model/update_pharmacy_profile_entity_model.dart';
import '../core_folder/app/app.locator.dart';
import '../core_folder/app/app.logger.dart';
import '../core_folder/network/network_service.dart';
import '../core_folder/network/url_path.dart';

@lazySingleton
class ConnectApi {
  final _service = locator<NetworkService>();
  
  final logger = getLogger('ConnectApi');

  Future<LoginResponseModel> signIn(LoginEntityModel signInEntity) async {
    try {
      final response = await _service.call(
        UrlConfig.sign_in,
        RequestMethod.post,
        data: signInEntity.toJson(),
      );
      logger.d(response.data);
      return LoginResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetTenantResponseModel> getUserDetails() async {
    try {
      final response = await _service.call(
        UrlConfig.get_tenant,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetTenantResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

   Future<dynamic> updateUser(
    UpdatePharmacyProfileEntityModel? updatePharmacy,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.update_pharmacy_profile,
        RequestMethod.patch,
        data: updatePharmacy!.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }
}

