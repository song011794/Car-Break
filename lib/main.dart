import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicle/controller/home_controller.dart';
import 'package:vehicle/repository/home_repository.dart';
import 'package:vehicle/screen/home_screen.dart';
import 'package:vehicle/screen/login_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: ScreenUtilInit(
        designSize: const Size(1080, 1920),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: child),
        child: const LoginScreen(),
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const LoginScreen()),
        GetPage(name: '/home', page: () => const HomeScreen(), bindings: [
          BindingsBuilder<HomeController>(() {
            Get.lazyPut(() => HomeController());
          }),
          BindingsBuilder<HomeRepository>(() {
            Get.lazyPut(() => HomeRepository());
          })
        ]),
      ],
    );
  }
}
