import '../helper/dio_hleper.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/register/data/repo/register_repo_imp.dart';
import 'package:blackmarket/core/networking/auth_network/register_ntework.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<RegisterRepoImp>(
    RegisterRepoImp(RegisterNetworking(dioHelper: DioHelper())),
  );
}
