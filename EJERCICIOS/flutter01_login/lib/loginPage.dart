import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFE62F16),
        width: double.infinity,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
 
            Container(
              padding: const EdgeInsets.only(top: 80),

              child: const Column(
                children: [
                  Image(
                    image: AssetImage('assets/path_logo.png'), width: 200
                  ),

                  Text('Beautiful, Private Sharing',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(255, 255, 255, 0.634)
                    ),
                  )
                ],
              )
            ),

            Column(
            
              children: [
            
                Container(
                  width: 230,
                  margin: const EdgeInsets.only(bottom: 20),
            
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                    ),
                    child: const Text('Sign Up',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE62F16),
                      ),
                    )
                  ),
                ),
            
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                
                  children: [
                    const Text('Already have a Path account?',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.634),
                      )
                    ),
                
                    Container(
                      width: 230,
                      margin: const EdgeInsets.only(top: 5, bottom: 22),
                
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(230, 47, 22, 1),
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          side: const BorderSide(width: 1.0, color: Color.fromRGBO(255, 255, 255, 0.634))
                        ),
                        child: const Text('Log In',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(255, 255, 255, 0.634),
                          ),
                        )
                      )
                    ),
                
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(text: "By using Path, you agree to Path's \n",
                        style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.634)),
                        children: [
                          TextSpan(text: "Terms of Use",
                            style: TextStyle(color: Colors.white, decoration: TextDecoration.underline)),
                          TextSpan(text: " and ",
                            style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.634))),
                          TextSpan(text: "Privacy Policy",
                            style: TextStyle(color: Colors.white, decoration: TextDecoration.underline)),
                          TextSpan(text: ".",
                            style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.634)))
                        ]),
                    )
                
                  ],
                )
            
              ],
            )

          ],

        ),
      )
    );
  }
}
