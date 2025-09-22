import 'package:go_router/go_router.dart';
import 'package:mobile/presentations/screens/home_screen.dart';
import 'package:mobile/presentations/screens/login_screen.dart';
import 'package:mobile/presentations/screens/register_screen.dart';

final router = GoRouter(
  initialLocation: "/login",
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
  ],
);
