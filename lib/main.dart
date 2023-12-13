import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:users_app/appInfo/app_info.dart';
import 'package:users_app/main/dashboard/dashboard_screen.dart';
import 'package:users_app/main/splash/splash_screen.dart';
import 'firebase_options.dart';
import 'main/auth/auth_page.dart';
import 'utils/light_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Permission.locationWhenInUse.isDenied.then((valueOfPermission) {
    if (valueOfPermission) {
      Permission.locationWhenInUse.request();
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

    return ChangeNotifierProvider(
      create: (context) => AppInfo(),
      child: MaterialApp(
        title: 'Flutter User App',
        debugShowCheckedModeBanner: false,
        theme: light,
        navigatorKey: navigatorKey, 
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              final user = snapshot.data;
              if (user == null) {
                return SplashScreen(
                  onInitializationComplete: () {
                    navigatorKey.currentState?.pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => const AuthPage(),
                      ),
                    );
                  },
                );
              } else {
                return SplashScreen(
                  onInitializationComplete: () {
                    navigatorKey.currentState?.pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => const DashboardScreen(
                          initialIndex: 0,
                        ),
                      ),
                    );
                  },
                );
              }
            } else {
              return const MaterialApp(
                debugShowCheckedModeBanner: false,
                home: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
