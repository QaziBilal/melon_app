import 'package:flutter/material.dart';
import 'package:melon_app/src/controller/choose_character_controller.dart';
import 'package:melon_app/src/controller/choose_machine_controller.dart';
import 'package:melon_app/src/controller/choose_mod_controller.dart';
import 'package:melon_app/src/controller/video_controller.dart';
import 'package:melon_app/src/helper/utils/routes.dart';
import 'package:melon_app/src/screens/choose_mods_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => ChooseCharacterController()),
        ChangeNotifierProvider(create: (context) => ChooseModController()),
        ChangeNotifierProvider(create: (context) => ChooseMachineController()),
        ChangeNotifierProvider(create: (context) => VideoState())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: ChooseModScreen.route,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
