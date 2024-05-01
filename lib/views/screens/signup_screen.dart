import 'package:ecommerce/constants/color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  List<String> genderList = ["Female", "Male", "Others"];
  String? gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    hintText: 'John Doe', labelText: 'Name'),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: const InputDecoration(
                  hintText: '1234567890',
                  labelText: 'Mobile No',
                ),
              ),
              TextFormField(
                minLines: 2,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: const InputDecoration(
                    hintText: '123 Street Locality,City,State,Country',
                    labelText: 'Address'),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text("Gender"),
              Row(
                children: List.generate(
                    genderList.length,
                    (index) => Row(
                          children: [
                            Radio(
                                value: genderList[index],
                                groupValue: gender,
                                onChanged: (val) {
                                  setState(() {
                                    gender = val;
                                  });
                                }),
                            Text(genderList[index])
                          ],
                        )),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                onTap: () {},
                title: "Sign Up",
              ),
              const SizedBox(
                height: 15,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Already have an account ',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: 'Sign Up',
                      style: const TextStyle(color: primaryColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
