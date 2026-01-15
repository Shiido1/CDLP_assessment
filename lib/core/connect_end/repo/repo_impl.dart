import 'package:injectable/injectable.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../contract/contract_impl.dart';
import '../model/get_tenant_response_model/get_tenant_response_model.dart';
import '../model/login_entity_model.dart';
import '../model/login_response_model/login_response_model.dart';
import '../model/update_pharmacy_profile_entity_model/update_pharmacy_profile_entity_model.dart';

@lazySingleton
class RepoImpl {
  final _session = locator<SharedPreferencesService>();
  final _contract = locator<ContractsImpl>();

  Future<LoginResponseModel> signIn(LoginEntityModel signInEntity) async {
    final response = await _contract.login(signInEntity);
    _chache(response);
    _session.isLogin = true;
    return response;
  }

  Future<GetTenantResponseModel> getTenant() async {
    final response = await _contract.getUserDetails();
    _chacheData(response);
    return response;
  }

  Future<dynamic> updateUser(
    UpdatePharmacyProfileEntityModel? updatePharmacy,
  ) async {
    final response = await _contract.updateUser(updatePharmacy);
    return response;
  }

  void _chache(data) {
    if (data != null) {
      _session.authToken = data.data.accessToken;
      _session.authRefreshToken = data.data.refreshToken;
      _session.usersData = data.data.toJson();
    }
  }

  void _chacheData(data) {
    if (data != null) {
      _session.usersData = data.data.toJson();
    }
  }
}
