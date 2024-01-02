import 'package:ecommerce_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 228, 228, 228),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    'lib/images/logo-nike.png',
                    height: 200,
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),

                // title
                const Text(
                  'Just Do It',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),

                const SizedBox(
                  height: 24,
                ),
                // sub title
                const Text(
                  'Branch new sneakers and custom kicks made with premium quantity',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 48,
                ),
                // start now button
                GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage())),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 24,
                          ),
                          child: Text(
                            'Shop now',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
