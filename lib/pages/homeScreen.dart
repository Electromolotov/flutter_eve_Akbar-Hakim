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
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Center(
                child: Stack(
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
              ),
              const SizedBox(height: 30),
              Center(child: Text(controller.displayName.value)),
              const SizedBox(height: 30),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text('12'),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Fundraising'),
                      ],
                    ),
                    VerticalDivider(width: 1),
                    Column(
                      children: [
                        Text('487'),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Followers'),
                      ],
                    ),
                    VerticalDivider(width: 1),
                    Column(
                      children: [
                        Text('126'),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Following'),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Divider(height: 1),
              const SizedBox(height: 35),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.wallet,
                              color: Colors.green,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('\$349'),
                                SizedBox(height: 5),
                                Text(
                                  'My wallet Balance',
                                  style: TextStyle(fontSize: 9),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.green, width: 1),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                              child: Text(
                            'Top up',
                            style: TextStyle(color: Colors.green),
                          )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'About',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Interest',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.edit,
                    color: Colors.green,
                    size: 15,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 5,
                children: [
                  Container(
                    width: 75,
                    height: 25,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.green, width: 1),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: Text(
                      'Medical',
                      style: TextStyle(color: Colors.green),
                    )),
                  ),
                  Container(
                    width: 75,
                    height: 25,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.green, width: 1),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: Text(
                      'Disaster',
                      style: TextStyle(color: Colors.green),
                    )),
                  ),
                  Container(
                    width: 75,
                    height: 25,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.green, width: 1),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: Text(
                      'Education',
                      style: TextStyle(color: Colors.green),
                    )),
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
