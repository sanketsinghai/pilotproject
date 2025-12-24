import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screens/auth/login_consumer_screen.dart';
import '../screens/auth/signup_consumer_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/temples/temples_list_screen.dart';
import '../screens/temples/temple_detail_screen.dart';
import '../screens/granths/granths_library_screen.dart';
import '../screens/granths/granth_detail_screen.dart';
import '../screens/dharamshalas/dharamshala_list_screen.dart';
import '../screens/dharamshalas/dharamshala_detail_screen.dart';
import '../screens/trips/trips_list_screen.dart';
import '../screens/trips/trip_detail_screen.dart';
import '../screens/pathshala/lessons_screen.dart';
import '../screens/pathshala/lesson_detail_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../services/auth_service.dart';

// Go Router configuration
final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(isAuthenticatedProvider);

  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      // If not authenticated, always go to login
      if (!authState) {
        // Allow auth routes
        if (state.matchedLocation == '/login' ||
            state.matchedLocation == '/signup') {
          return null;
        }
        return '/login';
      }

      // If authenticated, prevent going to auth screens
      if (authState) {
        if (state.matchedLocation == '/login' ||
            state.matchedLocation == '/signup') {
          return '/home';
        }
      }

      return null;
    },
    routes: [
      // Auth routes
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreenConsumer(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignupScreenConsumer(),
      ),

      // Main app routes
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'temples',
            builder: (context, state) => const TemplesListScreen(),
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return TempleDetailScreen(templeId: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: 'granths',
            builder: (context, state) => const GranthsLibraryScreen(),
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return GranthDetailScreen(granthId: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: 'dharamshalas',
            builder: (context, state) => const DharamshalaListScreen(),
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return DharamshalaDetailScreen(dharamshalaId: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: 'trips',
            builder: (context, state) => const TripsListScreen(),
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return TripDetailScreen(tripId: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: 'pathshala',
            builder: (context, state) => const LessonsScreen(),
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return LessonDetailScreen(lessonId: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: 'profile',
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
    ],
  );
});
