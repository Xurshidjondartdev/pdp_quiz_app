// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdp_quiz_app/core/style/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodePage extends StatefulWidget {
  const PinCodePage({super.key});

  @override
  State<PinCodePage> createState() => _PinCodePageState();
}

class _PinCodePageState extends State<PinCodePage> {
  EmailOTP myauth = EmailOTP();
  final formKey = GlobalKey<FormState>();
  late TextEditingController otp = TextEditingController(text: '');

  @override
  void didChangeDependencies() async {
    otp = TextEditingController();
    super.didChangeDependencies();
  }

  Future<void> sentCodeToEmail(String email) async {
    myauth.setConfig(
      appEmail: "me@rohitchouhan.com",
      appName: "Email OTP",
      userEmail: email,
      otpLength: 4,
      otpType: OTPType.digitsOnly,
    );
    if (await myauth.sendOTP() == true) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("OTP has been sent"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Oops, OTP send failed"),
      ));
    }
  }

  Widget numButton(int number) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: MaterialButton(
        onPressed: () {
          setState(() {
            if (otp.text.length < 4) {
              otp.text += number.toString();
            }
          });
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: AppColors.lD9D9D9,
        minWidth: 90,
        height: 60,
        child: Text(
          number.toString(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.l264653,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/Logo.png',
                width: 250,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 60),
            PinCodeTextField(
              controller: otp,
              obscureText: false,
              keyboardType: TextInputType.number,
              appContext: context,
              length: 4,
              cursorHeight: 90,
              onCompleted: (value) async {},
              textStyle: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal,
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              pinTheme: PinTheme(
                selectedColor: Colors.red,
                activeColor: AppColors.l00B533,
                shape: PinCodeFieldShape.box,
                borderWidth: 1,
                fieldWidth: 50,
                fieldHeight: 70,
                inactiveColor: AppColors.lD9D9D9,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 170),
            for (var i = 0; i < 3; i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  3,
                  (index) => numButton(1 + 3 * i + index),
                ).toList(),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: MaterialButton(
                    onPressed: () {
                      log('orqaga');
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: AppColors.lD9D9D9,
                    minWidth: 90,
                    height: 60,
                    child: const Icon(
                      Icons.arrow_back_outlined,
                      size: 30,
                      color: AppColors.l264653,
                    ),
                  ),
                ),
                numButton(0),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: MaterialButton(
                    onPressed: () {
                      log('o`chirdi');
                      if (otp.text.isNotEmpty) {
                        setState(
                          () {
                            otp.text =
                                otp.text.substring(0, otp.text.length - 1);
                          },
                        );
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: AppColors.lD9D9D9,
                    minWidth: 90,
                    height: 60,
                    child: Image.asset(
                      'assets/images/remove.png',
                      height: 30,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
