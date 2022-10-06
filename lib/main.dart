// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokeapi/pages/home/bindings/home_binding.dart';
import 'package:pokeapi/routes/app_pages.dart';

void main() async {
  await Hive.initFlutter();
  if (!await Hive.boxExists('userData')) {
    await Hive.openBox('userData');
  }
  if (!Hive.isBoxOpen('userData')) {
    await Hive.openBox('userData');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'POKEMON',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: Routes.home,
      initialBinding: HomeBinding(),
    );
  }
}
