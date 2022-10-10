import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/constants/colors.dart';

class ActiveApppbarWidget extends StatelessWidget {
  const ActiveApppbarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: AppColor.primary1,
          height: MediaQuery.of(context).size.height * 0.12,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          top: 30.0,
          left: 20.0,
          right: 20.0,
          child: AppBar(
            backgroundColor: AppColor.kWhite,
            leading: Image.asset(
              'assets/mc.png',
            ),
            primary: false,
            title: const TextField(
              decoration: InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: AppColor.primary,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: AppColor.primary,
                ),
                onPressed: () {},
              )
            ],
          ),
        )
      ],
    );
  }
}
