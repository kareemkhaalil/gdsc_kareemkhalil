import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gdsc_kareemkhalil/component/color.dart';

class AnimatedListScreen extends StatefulWidget {
  const AnimatedListScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedListScreen> createState() => _AnimatedListScreenState();
}

class _AnimatedListScreenState extends State<AnimatedListScreen> {
  var item = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated List'),
        centerTitle: true,
        leading: Container(),
        elevation: 0,
        backgroundColor: AppColors.lightBlue,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  item = item + 1;
                });
              },
              icon: const Icon(Icons.add, color: AppColors.lightBlue, size: 40),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              height: size.height * 0.8,
              child: AnimationLimiter(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: item,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      delay: const Duration(milliseconds: 200),
                      position: index,
                      child: SlideAnimation(
                        duration: const Duration(milliseconds: 2600),
                        verticalOffset: -850,
                        horizontalOffset: -300,
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: Container(
                          height: size.height / 10,
                          width: size.width * 0.8,
                          margin: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: Row(
                                children: [
                                  Text(
                                    'Item ${index + 1}',
                                    style: const TextStyle(
                                      color: AppColors.darkBlack,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        item = item - 1;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: AppColors.lightBlue,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
