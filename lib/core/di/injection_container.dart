import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../network/dio_client.dart';
import '../../data/datasources/remote/auth_remote_datasource.dart';
import '../../data/datasources/remote/order_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/repositories/order_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/order_repository.dart';
import '../../presentation/providers/auth_provider.dart';
import '../../presentation/providers/create_parcel_provider.dart';
import '../../presentation/providers/order_provider.dart';

class InjectionContainer {
  InjectionContainer._();

  static final DioClient _dioClient = DioClient();

  static DioClient get dioClient => _dioClient;

  static List<SingleChildWidget> get providers {
    // Data sources
    final authRemoteDataSource = AuthRemoteDataSourceImpl(_dioClient);
    final orderRemoteDataSource = OrderRemoteDataSourceImpl(_dioClient);

    // Repositories
    final AuthRepository authRepository = AuthRepositoryImpl(
      authRemoteDataSource,
      _dioClient,
    );
    final OrderRepository orderRepository = OrderRepositoryImpl(
      orderRemoteDataSource,
    );

    return [
      // Providers
      ChangeNotifierProvider<AuthProvider>(
        create: (_) => AuthProvider(authRepository),
      ),
      ChangeNotifierProvider<OrderProvider>(
        create: (_) => OrderProvider(orderRepository),
      ),
      ChangeNotifierProvider<CreateParcelProvider>(
        create: (_) => CreateParcelProvider(),
      ),
    ];
  }
}
