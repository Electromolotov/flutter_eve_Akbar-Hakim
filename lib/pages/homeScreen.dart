import 'package:firebase_login_signin/controllers/homeController.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        FontAwesomeIcons.google,
                        color: Colors.green,
                      ),
                      SizedBox(width: 10),
                      Text('Profile')
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.settings,
                        color: Colors.green,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.more_vert,
                        color: Colors.green,
                        size: 20,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 40),
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  CircleAvatar(
                    maxRadius: 50,
                    minRadius: 50,
                    foregroundImage: AssetImage('assets/pp.jpg'),
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 11,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Text(controller.displayName.value),
            ],
          ),
        ),
      ),
    );
  }
}
