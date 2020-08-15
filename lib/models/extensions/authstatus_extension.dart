import 'package:jumpets_app/models/wrappers/auth_status.dart';

extension AuthStatusExtension on AuthenticationStatus {
  bool get isAuthenticated => this == AuthenticationStatus.authenticated;
}
