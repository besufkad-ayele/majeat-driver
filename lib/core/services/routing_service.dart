import 'package:go_router/go_router.dart';
import 'package:majeat_driver/feature/onBoarding/view/pages/onboarding_page.dart';

import '../../main.dart';
import '../constants/routing_constants.dart';


class RoutingService {
  late GoRouter router;

  RoutingService() {
    router = GoRouter(
      redirect: (context, state) async {
        String? redirectRoute;

        // Check if user is authenticated
        bool isAuthenticated = checkAuthentication(); // Replace with your logic

        if (!isAuthenticated) {
          // Redirect unauthenticated users to login page
          redirectRoute = RoutingConstants.authenticationRoute;
        } else {
          // Authenticated users, redirect to home screen
          redirectRoute = RoutingConstants.initialRoute;
        }

        return redirectRoute;
      },
      routes: <GoRoute>[
        GoRoute(
          name: '/',
          path: RoutingConstants.initialRoute,
          builder: (context, state) =>  const MyApp(),
        ),
        GoRoute(
          name: 'onboarding',
          path: RoutingConstants.authenticationRoute,
          builder: (context, state) => const OnboardingPage(), // Your login page widget
        ),
      ],
    );
  }

  bool checkAuthentication() {
    // Replace this with your authentication logic

    // For example, check if the user is logged in or has valid credentials
    return true; // Return true if authenticated, false otherwise
  }
}
