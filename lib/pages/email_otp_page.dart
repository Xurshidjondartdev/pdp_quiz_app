import 'package:flutter/material.dart';

class EmailOtpPage extends StatefulWidget {
  const EmailOtpPage({super.key});

  @override
  State<EmailOtpPage> createState() => _EmailOtpPageState();
}

class _EmailOtpPageState extends State<EmailOtpPage> {
  ///Properties
  bool isPasswordFilledTrue = false;
  bool isObscureText = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ///Methods
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment
                .start, // Ensures children are aligned to the start (left)
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/Logo.png'),
                ],
              ),
              const SizedBox(height: 50),
              const Align(
                alignment: Alignment.centerLeft, // Align text to the left
                child: Text(
                  'Hello,',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft, // Align text to the left
                child: Text(
                  'You are welcome',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 50),

              ///email text fild

              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              ///pasword text fild
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                obscureText: isObscureText,
                decoration: InputDecoration(
                   suffixIcon: IconButton(
                    onPressed: () {
                      isObscureText = !isObscureText;
                      setState(() {});
                    },
                    splashRadius: 20,
                    icon: isObscureText
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),),),
              ),
              const SizedBox(height: 30),
              MaterialButton(
                onPressed: () {
                  if (emailController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter your email',
                            textAlign: TextAlign.center),
                      ),
                    );
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EmailOtpPage()),
                    );
                  }
                },
                color: const Color(0xff00B533),
                elevation: 0,
                height: 60,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Sing In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                      child: Divider(
                          indent: 50, height: 2, color: Color(0xffD9D9D9))),
                  GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Please enter your ',
                                  textAlign: TextAlign.center)),
                        );
                      },
                      child: const Text(' Or Sign in With ',
                          style: TextStyle(color: Color(0xffC1C1C1)))),
                  const Expanded(
                    child: Divider(
                        endIndent: 50, height: 2, color: Color(0xffD9D9D9)),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: MaterialButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter your Account',
                            textAlign: TextAlign.center),
                      ),
                    );
                  },
                  height: 44,
                  minWidth: 44,
                  color: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset('assets/images/googleIcon.png',
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Don’t have an account? ',
                      style: TextStyle(fontSize: 13)),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter your Account ',
                              textAlign: TextAlign.center),
                        ),
                      );
                    },
                    child: const Text('Sign up',
                        style:
                            TextStyle(fontSize: 13, color: Color(0xff00B533))),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
