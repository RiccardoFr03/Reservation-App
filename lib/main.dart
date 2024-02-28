import 'package:cloud_craft_solution/domain/models/reservation_date_model.dart';
import 'package:cloud_craft_solution/domain/notification_settings.dart';
import 'package:cloud_craft_solution/domain/oauth_config.dart';
import 'package:cloud_craft_solution/ui/screens/desk_screen.dart';
import 'package:cloud_craft_solution/ui/screens/login_screen.dart';
import 'package:cloud_craft_solution/ui/screens/my_bottom_nav_bar.dart';
import 'package:cloud_craft_solution/ui/screens/new_reservation_screen.dart';
import 'package:cloud_craft_solution/ui/screens/register_screen.dart';
import 'package:cloud_craft_solution/ui/screens/rooms_screen.dart';
import 'package:cloud_craft_solution/ui/screens/welcome_screen.dart';
import 'package:cloud_craft_solution/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting('it_IT', null).then((_) {
    WidgetsFlutterBinding.ensureInitialized();
    NotificationService().initNotification();
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reservations',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      navigatorKey: OauthConfig.navigatorKey,
      onGenerateRoute: (settings) {
        var routName = settings.name;
        var args = settings.arguments;

        var routes = {
          "/login": (context) => const LoginScreen(),
          "/register": (context) => const RegisterScreen(),
          "/home": (context) => const MyBottomNavBar(),
          "/welcome": (context) => const WelcomeScreen(),
          "/free_rooms": (context) => RoomsScreen(
              reservatiDateModel:
                  args as ReservatiDateModel? ?? ReservatiDateModel()),
          '/desks': (context) => DeskScreen(
              reservatiDateModel:
                  args as ReservatiDateModel? ?? ReservatiDateModel()),
          "/new_reservation": (context) => const NewReservationScreen(),
        };

        WidgetBuilder builder = routes[routName] ??
            (context) =>
                const WelcomeScreen(); /* DeskScreen(
                reservatiDateModel:
                    args as ReservatiDateModel? ?? ReservatiDateModel());*/

        return MaterialPageRoute(builder: (context) => builder(context));
      },
    );
  }
}
