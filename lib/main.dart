import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:locabite/dependencies.dart' as dependencies;
import 'package:locabite/routes/chef/add_meal_page.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dependencies.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:AddMealPage(),
      // initialRoute: AppRoute.splashPage,
      // getPages: AppRoute.routes,
      
    );
  }
}
