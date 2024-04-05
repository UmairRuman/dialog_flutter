import 'package:dialog_flutter/ButtonContainers/CancelContainer.dart';
import 'package:dialog_flutter/ButtonContainers/ConfirmContainer.dart';
import 'package:dialog_flutter/textField.dart';
import 'package:dialog_flutter/topCircleAvater.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomDialogue extends StatefulWidget {
  const CustomDialogue({super.key});

  @override
  State<CustomDialogue> createState() => _CustomDialogueState();
}

class _CustomDialogueState extends State<CustomDialogue>
    with SingleTickerProviderStateMixin {
  double opacityBegin = 0;
  double opacityEnd = 1;

  late AnimationController _animationController;

  late Animation<Offset> _slideAnimation;

  late Animation<double> fadeAnimation;
  final Tween<Offset> slideTween =
      Tween(begin: const Offset(0, -0.2), end: Offset.zero);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _slideAnimation = slideTween.animate(
      _animationController,
    );
    //Fade Animation for releastic effect in DiaLogue Pop Up and Pop In
    fadeAnimation = Tween<double>(begin: opacityBegin, end: opacityEnd)
        .animate(_animationController);
  }

  Future<void> _onTap() async {
    await _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          child: FloatingActionButton(
            //Here you can use any other widget , from whom on pressed event you want to show Dialog
            onPressed: () {
              _animationController.forward();
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return FadeTransition(
                    opacity: fadeAnimation,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: Center(
                        //Used SingleChildScrollView to bind Circle Avater and dialog
                        child: SingleChildScrollView(
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: SizedBox(
                                  height: 250,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 12, left: 12, right: 12),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Spacer(
                                          flex: 35,
                                        ),
                                        //Text Field
                                        const Expanded(
                                            flex: 30, child: MyTextField()),
                                        const Spacer(
                                          flex: 8,
                                        ),
                                        //If you want to change spacing between Buttons which is actually Containers, change flex from here
                                        Expanded(
                                          flex: 22,
                                          child: Row(
                                            children: [
                                              const Spacer(
                                                flex: 5,
                                              ),
                                              //Cancel Button(Container)
                                              Expanded(
                                                  flex: 42,
                                                  child: CancelContainer(
                                                    onClick: _onTap,
                                                  )),
                                              const Spacer(
                                                flex: 6,
                                              ),
                                              //Confirm Button(Container)
                                              const Expanded(
                                                  flex: 42,
                                                  child: ConfirmContainer()),
                                              const Spacer(
                                                flex: 5,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Spacer(
                                          flex: 5,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              //Circle Avatar for your app logo
                              const MyCircleAvatar()
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            backgroundColor: Colors.amber,
            child: const Text("Show Dialog"),
          ),
        ),
      ),
    );
  }
}
