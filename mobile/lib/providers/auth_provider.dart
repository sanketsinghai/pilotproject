import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/auth_service.dart';

// Export the auth providers from auth_service
export '../services/auth_service.dart' show
    authServiceProvider,
    authStateProvider,
    currentUserProvider,
    isAuthenticatedProvider,
    authStateNotifierProvider;
