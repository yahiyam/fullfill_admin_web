import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';
import 'package:fullfill_admin_web_portal/constants/sizes.dart';
import 'package:fullfill_admin_web_portal/features/view/auth/login.dart';
import 'package:fullfill_admin_web_portal/features/view_model/auth/login_provider.dart';
import 'package:fullfill_admin_web_portal/features/view_model/auth/obscure_provider.dart';
import 'package:fullfill_admin_web_portal/features/view_model/drawer/select_button_index.dart';
import 'package:fullfill_admin_web_portal/features/view_model/home/time_date.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB31m7RIF2SwtN44DIugo34R_aSZPRc5yo",
      projectId: "fullfill-a32e3",
      messagingSenderId: "336199550257",
      appId: "1:336199550257:web:5b1636afd0ab767e1cdc10",
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Obscure()),
        ChangeNotifierProvider(create: (context) => SelectButton()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => DateTimeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    KSizes.size = MediaQuery.sizeOf(context);
    return MaterialApp(
      title: 'FULLFILL admin web portal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.secularOneTextTheme(),
        scaffoldBackgroundColor: KColors.scaffoldBgColor,
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
