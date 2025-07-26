import 'package:finance_app/ui/screen/create_new_password_screen.dart';
import 'package:finance_app/ui/screen/forgot_password_screen.dart';
import 'package:finance_app/ui/screen/home_screen.dart';
import 'package:finance_app/ui/screen/login_screen.dart';
import 'package:finance_app/ui/screen/my_card_screen.dart';
import 'package:finance_app/ui/screen/my_profile_screen.dart';
import 'package:finance_app/ui/screen/on_boarding_screen.dart';
import 'package:finance_app/ui/screen/otp_verifcation_screen.dart';
import 'package:finance_app/ui/screen/password_changed_screen.dart';
import 'package:finance_app/ui/screen/register_screen.dart';
import 'package:finance_app/ui/screen/statistic_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String onBoardingRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String createNewPasswordRoute = '/createNewPassword';
  static const String passwordChangedRoute = '/passwordChanged';
  static const String otpVerifcationRoute = '/otpVerifcation';
  static const String homeRoute = '/home';
  static const String myCardRoute = '/myCard';
  static const String myProfileRoute = '/myProfile';
  static const String statisticRoute = '/statistic';
}

class RouteManager {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.onBoardingRoute,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: Routes.loginRoute,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: Routes.registerRoute,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: Routes.forgotPasswordRoute,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: Routes.otpVerifcationRoute,
        builder: (context, state) => const OtpVerifcationScreen(),
      ),
      GoRoute(
        path: Routes.createNewPasswordRoute,
        builder: (context, state) => const CreateNewPasswordScreen(),
      ),
      GoRoute(
        path: Routes.passwordChangedRoute,
        builder: (context, state) => const PasswordChangedScreen(),
      ),
      GoRoute(
        path: Routes.homeRoute,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: Routes.myCardRoute,
        builder: (context, state) => const MyCardScreen(),
      ),
      GoRoute(
        path: Routes.myProfileRoute,
        builder: (context, state) => const MyProfileScreen(),
      ),
      GoRoute(
        path: Routes.statisticRoute,
        builder: (context, state) => const StatisticScreen(),
      ),
    ],
  );
}
