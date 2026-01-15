import 'package:assessment/core/api_folder/connect_api.dart';
import 'package:injectable/injectable.dart';
import '../../core_folder/app/app.locator.dart';
import '../model/get_tenant_response_model/get_tenant_response_model.dart';
import '../model/login_entity_model.dart';
import '../model/login_response_model/login_response_model.dart';
import '../model/update_pharmacy_profile_entity_model/update_pharmacy_profile_entity_model.dart';

@lazySingleton
class ContractsImpl {
  final _api = locator<ConnectApi>();

  Future<LoginResponseModel> login(LoginEntityModel loginEntity) async =>
      await _api.signIn(loginEntity);
  Future<dynamic> updateUser(
    UpdatePharmacyProfileEntityModel? updatePharmacy,
  ) async => await _api.updateUser(updatePharmacy);
  Future<GetTenantResponseModel> getUserDetails() async => await _api.getUserDetails();
}
