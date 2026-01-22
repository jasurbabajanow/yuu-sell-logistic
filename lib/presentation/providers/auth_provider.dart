import 'package:flutter/material.dart';
import '../../core/errors/result.dart';
import '../../data/models/register_request.dart';
import '../../data/models/login_request.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

enum AuthStatus {
  initial,
  loading,
  authenticated,
  unauthenticated,
  error,
}

class AuthProvider extends ChangeNotifier {
  final AuthRepository _authRepository;

  AuthProvider(this._authRepository);

  AuthStatus _status = AuthStatus.initial;
  UserEntity? _user;
  String? _errorMessage;

  AuthStatus get status => _status;
  UserEntity? get user => _user;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => _status == AuthStatus.authenticated;
  bool get isLoading => _status == AuthStatus.loading;

  void _setLoading() {
    _status = AuthStatus.loading;
    _errorMessage = null;
    notifyListeners();
  }

  void _setError(String message) {
    _status = AuthStatus.error;
    _errorMessage = message;
    notifyListeners();
  }

  void _setAuthenticated(UserEntity user) {
    _status = AuthStatus.authenticated;
    _user = user;
    _errorMessage = null;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  Future<bool> register({
    required String email,
    required String phone,
    required String password,
    String firstName = '',
    String lastName = '',
    String role = '',
  }) async {
    _setLoading();

    final request = RegisterRequest(
      email: email,
      phone: phone,
      password: password,
      firstName: firstName,
      lastName: lastName,
      role: role,
    );

    final result = await _authRepository.register(request);

    return result.when(
      success: (user) {
        _setAuthenticated(user);
        return true;
      },
      failure: (message, statusCode) {
        _setError(message);
        return false;
      },
    );
  }

  Future<bool> login({
    required String emailOrPhone,
    required String password,
  }) async {
    _setLoading();

    final request = LoginRequest(
      emailOrPhone: emailOrPhone,
      password: password,
    );

    final result = await _authRepository.login(request);

    return result.when(
      success: (user) {
        _setAuthenticated(user);
        return true;
      },
      failure: (message, statusCode) {
        _setError(message);
        return false;
      },
    );
  }

  Future<void> logout() async {
    _setLoading();

    final result = await _authRepository.logout();

    result.when(
      success: (_) {
        _status = AuthStatus.unauthenticated;
        _user = null;
        notifyListeners();
      },
      failure: (message, statusCode) {
        _setError(message);
      },
    );
  }
}
