import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_media/res/theme/app_theme.dart';
import 'package:tech_media/utils/routes/route_name.dart';
import 'package:tech_media/utils/routes/routes.dart';
import 'package:tech_media/view/splash_screen.dart';
import 'package:tech_media/view_model/controllers/auth_controllers/register_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => RegisterController())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.myAppTheme,
        home: const SplashScreen(),
        initialRoute: AppRouteName.splashScreen,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
