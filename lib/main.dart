import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicle/controller/sign_in_controller.dart';
import 'package:vehicle/screen/home_screen.dart';
import 'package:vehicle/screen/login_screen.dart';
import 'package:vehicle/screen/sign_in_screen.dart';
import 'package:vehicle/util/translations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      locale: const Locale('ko', 'KR'),
      home: ScreenUtilInit(
        designSize: const Size(1080, 1920),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
            title: 'app_title'.tr,
            theme: ThemeData(
              primaryColor: Colors.white,
            ),
            home: child),
        child: FutureBuilder<String>(
            future: FirebaseAuth.instance.currentUser?.getIdToken(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.none) {
                return LoginScreen();
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return const HomeScreen();
                } else {
                  return LoginScreen();
                }
              } else {
                return Container();
              }
            }),
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginScreen()),
        GetPage(
            name: '/signin',
            page: () => SignInScreen(),
            binding: BindingsBuilder(
              () => Get.lazyPut(() => SignInController()),
            )),
        GetPage(
          name: '/home',
          page: () => const HomeScreen(),
        ),
      ],
    );
  }
}
