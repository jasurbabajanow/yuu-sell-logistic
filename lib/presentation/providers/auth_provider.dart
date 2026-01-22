import 'package:flutter/material.dart';
import '../../core/errors/result.dart';
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
  String? _phone;

  AuthStatus get status => _status;
  UserEntity? get user => _user;
  String? get errorMessage => _errorMessage;
  String? get phone => _phone;
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
    required String phone,
    required String name,
  }) async {
    _setLoading();

    final result = await _authRepository.register(
      phone: phone,
      name: name,
    );

    return result.when(
      success: (message) {
        _phone = phone;
        _status = AuthStatus.unauthenticated;
        notifyListeners();
        return true;
      },
      failure: (message, statusCode) {
        _setError(message);
        return false;
      },
    );
  }

  Future<bool> verifyOtp({
    required String otp,
  }) async {
    if (_phone == null) {
      _setError('Phone number not found. Please register again.');
      return false;
    }

    _setLoading();

    final result = await _authRepository.verifyOtp(
      phone: _phone!,
      otp: otp,
    );

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
    required String phone,
    required String password,
  }) async {
    _setLoading();

    final result = await _authRepository.login(
      phone: phone,
      password: password,
    );

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
        _phone = null;
        notifyListeners();
      },
      failure: (message, statusCode) {
        _setError(message);
      },
    );
  }
}
