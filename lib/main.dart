import 'package:flutter/material.dart';
import 'package:fullfill_admin_web_portal/constants/colors.dart';
import 'package:fullfill_admin_web_portal/constants/sizes.dart';
import 'package:fullfill_admin_web_portal/features/view/auth/login.dart';
import 'package:fullfill_admin_web_portal/features/view_model/auth/login_provider.dart';
import 'package:fullfill_admin_web_portal/features/view_model/auth/obscure_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Obscure()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
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
        colorScheme: ColorScheme.fromSeed(seedColor: KColors.deepPurple),
        scaffoldBackgroundColor: KColors.purpleDark,
        primarySwatch: KColors.blue,
        canvasColor: KColors.purpleLight,
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
