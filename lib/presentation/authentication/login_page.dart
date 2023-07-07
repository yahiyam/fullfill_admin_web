import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  String adminEmail = "";
  String adminPassword = "";

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastEaseInToSlowEaseOut,
      ),
    );
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double imageWidth = screenSize.width * 0.3;
    final double imageHeight = imageWidth;

    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Stack(
            children: [
              Center(
                child: SizedBox(
                  width: imageWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image
                      FadeTransition(
                        opacity: _animation,
                        child: Image.asset(
                          "images/admin.png",
                          width: imageWidth,
                          height: imageHeight,
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Email text field
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            adminEmail = value;
                          });
                        },
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.cyan,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.pinkAccent,
                              width: 2,
                            ),
                          ),
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.grey),
                          icon: Icon(
                            Icons.email,
                            color: Colors.cyan,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Password text field
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            adminPassword = value;
                          });
                        },
                        obscureText: true,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.cyan,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.pinkAccent,
                              width: 2,
                            ),
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.grey),
                          icon: Icon(
                            Icons.admin_panel_settings,
                            color: Colors.cyan,
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Button login
                      FadeTransition(
                        opacity: _animation,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                horizontal: screenSize.width * 0.1,
                                vertical: screenSize.height * 0.025,
                              ),
                            ),
                          ),
                          child: const Text("Login"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
