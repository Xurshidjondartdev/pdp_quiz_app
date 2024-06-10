import 'package:flutter/material.dart';

class CreateAccauntPage extends StatefulWidget {
  const CreateAccauntPage({super.key});

  @override
  State<CreateAccauntPage> createState() => _CreateAccauntPageState();
}

class _CreateAccauntPageState extends State<CreateAccauntPage> {
  ///Properties
  bool isPasswordFilledTrue = false;
  bool isChecked = false;
  TextEditingController emailController = TextEditingController();

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
              const Align(
                alignment: Alignment.centerLeft, // Align text to the left
                child: Text(
                  'Create an account',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft, // Align text to the left
                child: Text(
                  'Let’s help you set up your account,',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft, // Align text to the left
                child: Text(
                  'it won’t take long.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 50),

              ///first name textfild
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
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

              ///last name textfild
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
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

              ///Phone  textfild
              TextField(
                controller: emailController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
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
              const SizedBox(height: 25),
              Row(
                children: [
                  ///checkBox
                  Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      }),
                  const Text('Accept terms & Condition',
                      style: TextStyle(color: Color(0xffD9D9D9)))
                ],
              ),
              const SizedBox(height: 25),
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
                          builder: (context) => const CreateAccauntPage()),
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
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
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
                  const Text('Don’t have an account?',
                      style: TextStyle(fontSize: 13)),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter your Account',
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
