import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../network/dio_client.dart';
import '../../data/datasources/remote/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../presentation/providers/auth_provider.dart';

class InjectionContainer {
  InjectionContainer._();

  static final DioClient _dioClient = DioClient();

  static DioClient get dioClient => _dioClient;

  static List<SingleChildWidget> get providers {
    // Data sources
    final authRemoteDataSource = AuthRemoteDataSourceImpl(_dioClient);

    // Repositories
    final AuthRepository authRepository = AuthRepositoryImpl(
      authRemoteDataSource,
      _dioClient,
    );

    return [
      // Providers
      ChangeNotifierProvider<AuthProvider>(
        create: (_) => AuthProvider(authRepository),
      ),

      // Add more providers here as you create them
      // ChangeNotifierProvider<UserProvider>(
      //   create: (_) => UserProvider(userRepository),
      // ),
    ];
  }
}
