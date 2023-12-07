import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orphanagemanagement/firebase_options.dart';
import 'package:orphanagemanagement/view/modules/orphanage/login_page.dart';
import 'package:orphanagemanagement/view/modules/orphanage/main_page_orphanage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: CreateCustomeNotificationPageOrphanage(),
        // home: ExplorePageInHomeIndividual(),

        // home:UserSelectionPageIndividualAndOrganization(),
        // home: LoginPageOrphanage(),
        // home: MainPageIndividual(),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MainPageOrphanage();
              } else {
                return LoginPageOrphanage();
              }
            }));
  }
}
