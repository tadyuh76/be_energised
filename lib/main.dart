import 'package:be_energised/firebase_options.dart';
import 'package:be_energised/helpers/auth_control_helper.dart';
import 'package:be_energised/helpers/keyboard_dismiss_helper.dart';
import 'package:be_energised/screens/auth/login_screen.dart';
import 'package:be_energised/screens/battery/battery_screen.dart';
import 'package:be_energised/screens/friends/friends_screen.dart';
import 'package:be_energised/screens/home/home_screen.dart';
import 'package:be_energised/screens/statistics/statistics_screen.dart';
import 'package:be_energised/utils/disable_scroll_glow.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: KeyboardDismissHelper(child: App())));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        scaffoldBackgroundColor: Colors.transparent,
      ),
      scrollBehavior: DisableScrollGlow().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown,
          PointerDeviceKind.trackpad,
        },
      ),
      routes: {
        AuthControlHelper.routeName: (context) => const AuthControlHelper(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        BatteryScreen.routeName: (context) => const BatteryScreen(),
        FriendsScreen.routeName: (context) => const FriendsScreen(),
        StatisticsScreen.routeName: (context) => const StatisticsScreen(),
      },
      home: const AuthControlHelper(),
    );
  }
}
