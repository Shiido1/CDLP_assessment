import 'package:assessment/dashoard_screen.dart';
import 'package:assessment/login_page.dart';
import 'package:assessment/profile_screen.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../api_folder/connect_api.dart';
import '../../connect_end/contract/contract_impl.dart';
import '../../connect_end/repo/repo_impl.dart';
import '../../connect_end/viewmodel/viewmodel.dart';
import '../manager/shared_preference.dart';
import '../network/network_service.dart';

@StackedApp(
  routes: [
    CustomRoute(
      page: MyHomePage,
      transitionsBuilder: TransitionsBuilders.slideRight,
      durationInMilliseconds: 300,
    ),
    CustomRoute(
      page: ProfileScreen,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 300,
    ),
    CustomRoute(
      page: DashoardScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 300,
    ),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: SharedPreferencesService),
    LazySingleton(classType: NetworkService),
    LazySingleton(classType: ConnectApi),
    LazySingleton(classType: ContractsImpl),
    LazySingleton(classType: RepoImpl),
    LazySingleton(classType: ViewModel),
  ],
  logger: StackedLogger(),
)
class App {}
