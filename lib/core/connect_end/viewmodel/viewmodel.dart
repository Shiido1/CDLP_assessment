// ignore_for_file: strict_top_level_inference

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../appAsset/app_utils.dart';
import '../../../main.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/app/app.logger.dart';
import '../../core_folder/app/app.router.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../model/get_tenant_response_model/get_tenant_response_model.dart';
import '../model/login_entity_model.dart';
import '../model/login_response_model/login_response_model.dart';
import '../model/transaction_model.dart';
import '../model/update_pharmacy_profile_entity_model/update_pharmacy_profile_entity_model.dart';
import '../repo/repo_impl.dart';

class ViewModel extends BaseViewModel {
  final BuildContext? context;

  final logger = getLogger('ViewModel');

  final repositoryImply = RepoImpl();
  final session = locator<SharedPreferencesService>();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isOnDark = false;
  bool get isOnDark => _isOnDark;
  bool updateProfile = true;

  LoginResponseModel? _loginResponseModel;
  LoginResponseModel? get loginResponseModel => _loginResponseModel;
  GetTenantResponseModel? _getTetantResponseModel;
  GetTenantResponseModel? get getTetantResponseModel => _getTetantResponseModel;

  ViewModel({this.context});

  List<TransactionModel> transactionList = [
    TransactionModel(
      transactionNumber: '3DEK493423',
      description:
          'Classification of the financial transaction such as deposit, withdrawal, transfer, or payment',
    ),
    TransactionModel(
      transactionNumber: '4EK5914221',
      description:
          'The nature of the transaction (e.g., withdrawal, sale, payment, fee).',
    ),
    TransactionModel(
      transactionNumber: '94P23P3O56',
      description: 'This transaction was not valid',
    ),
    TransactionModel(
      transactionNumber: '1POR94O564',
      description: 'This transaction was a withdrawal transaction',
    ),
    TransactionModel(
      transactionNumber: '30PRO4P545',
      description:
          'Details describing the type of banking transaction executed.',
    ),
    TransactionModel(
      transactionNumber: '4K0PRO9JMD',
      description:
          'Transaction type specifying whether the operation was a payment, refund, transfer, or charge.',
    ),
    TransactionModel(
      transactionNumber: '6FLLOPERR4',
      description:
          'The nature of the transaction (e.g., purchase, sale, withdrawal, deposit, transfer, payment, fee).',
    ),
    TransactionModel(
      transactionNumber: 'ED50ORIPTD',
      description:
          'Nature of wallet transaction including debit or credit operation..',
    ),
    TransactionModel(
      transactionNumber: '3WERSZXCVB',
      description:
          'The description of the transaction (e.g., purchase, sale, withdrawal, ).',
    ),
  ];

  Future<void> toggleSwitch(bool newValue) async {
    _isOnDark = newValue;
    saveSharedPreferenceDarkMode(newValue);
    notifyListeners();
  }

  void saveSharedPreferenceDarkMode(value) {
    session.isOnDark = value;
    notifyListeners();
  }

  Future<void> getSaveSharedPreferenceDarkMode() async {
    _isOnDark = session.isOnDark;
    notifyListeners();
  }

  void signIn(context, {LoginEntityModel? signInEntity}) async {
    try {
      _isLoading = true;

      _loginResponseModel = await runBusyFuture(
        repositoryImply.signIn(signInEntity!),
        throwException: true,
      );
      _isLoading = false;
      if (_loginResponseModel?.statusCode == 201) {
        await AppUtils.snackbar(
          context,
          message: _loginResponseModel?.message ?? '',
        );
        navigate.navigateTo(Routes.dashoardScreen);
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getTenant(context) async {
    try {
      _isLoading = true;
      
      _getTetantResponseModel = await runBusyFuture(
        repositoryImply.getTenant(),
        throwException: true,
      );
      await Future.delayed(Duration(seconds: 3));
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void updateUser(context, {UpdatePharmacyProfileEntityModel? update}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.updateUser(update),
        throwException: true,
      );
      _isLoading = false;
      await AppUtils.snackbar(context, message: v['message']);
      updateProfile = true;
      navigate.back();
      navigate.navigateTo(Routes.dashoardScreen);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }
}
