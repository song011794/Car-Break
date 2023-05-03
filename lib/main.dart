import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:vehicle/controller/sign_in_controller.dart';
import 'package:vehicle/lib_color_schemes.g.dart';
import 'package:vehicle/screen/home_screen.dart';
import 'package:vehicle/screen/login_screen.dart';
import 'package:vehicle/screen/sign_in_screen.dart';
import 'package:vehicle/util/permission.dart';
import 'package:vehicle/util/translations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _initTmapAPI();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: ".env");

  // runApp() 호출 전 Kakao SDK 초기화
  KakaoSdk.init(
    nativeAppKey: dotenv.get('KAKAO_NATIVE_KEY'),
    javaScriptAppKey: dotenv.get('KAKAO_JAVASCRIPT_KEY'),
  );
  runApp(const MyApp());
}

Future<void> _initTmapAPI() async {
  try {
    final String result =
        await MethodChannel('mobile/parameters').invokeMethod('initTmapAPI');
    print('initTmapAPI Result : ${result}');
  } catch (e) {
    print(e.toString());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await PermissionHandler().requestPermission();
    });

    return GetMaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          fontFamily: 'NotoSansKR'),
      darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          fontFamily: 'NotoSansKR'),
      themeMode: ThemeMode.system,
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
                if (snapshot.hasData &&
                    (FirebaseAuth.instance.currentUser?.emailVerified ??
                        false)) {
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
