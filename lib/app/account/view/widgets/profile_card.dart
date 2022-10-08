import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/login/view/login.dart';
import 'package:menz_cart_app/app/login/view_model/login_provider.dart';
import 'package:menz_cart_app/app/user/view_model/user_provider.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:provider/provider.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = context.read<UserProvider>().UserList;
    return Stack(
      children: [
        Container(
          color: const Color.fromARGB(89, 156, 168, 250),
          height: 200,
        ),
        Container(
          height: 100,
          color: const Color.fromARGB(224, 78, 88, 151),
        ),
        Positioned(
          bottom: 40,
          left: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLlUIlrkWrEKWhugFbim3s8h33j9Uk4hdRbkHI2TEn7ueop1DQ9yEoiW9vz4_jtJc786A&usqp=CAU',
              width: 120,
            ),
          ),
        ),
        context.watch<LoginProvider>().isLogged
            ? Positioned(
                // bottom: 0,
                // left: 0,
                top: 80,
                right: 50,
                child: Text(
                  "Hello, ${data[0].userName}",
                ),
              )
            : Positioned(
                bottom: 40,
                right: 10,
                child: TextButton(
                  onPressed: () {
                    RoutesProvider.nextScreen(
                      screen: const LoginScreen(),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primary),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                        horizontal: 70,
                      ),
                    ),
                  ),
                  child: Text(
                    'LOGIN / SIGN UP',
                    style: TextStyle(color: kWhite),
                  ),
                ),
              )
      ],
    );
  }
}
