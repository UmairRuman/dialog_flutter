import 'package:flutter/material.dart';

class CancelContainer extends StatefulWidget {
  CancelContainer({super.key, required this.onClick});
  VoidCallback onClick;

  @override
  State<CancelContainer> createState() => _CancelContainerState();
}

class _CancelContainerState extends State<CancelContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        widget.onClick();
        //Delayed added in purpose to keep same animation behavior as previous version when dialog was pop up with sliding animation
        await Future<void>.delayed(
          const Duration(milliseconds: 1000),
        );
        Navigator.of(context).pop();
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [BoxShadow(offset: Offset(5, 5), blurRadius: 5)]),
        child: const Column(
          children: [
            Spacer(
              flex: 20,
            ),
            Expanded(
                flex: 60,
                child: Row(
                  children: [
                    //If you want to change spacing in Buttons for its child, change flex from here
                    Spacer(
                      flex: 5,
                    ),
                    Expanded(flex: 30, child: Icon(Icons.close_rounded)),
                    Spacer(
                      flex: 5,
                    ),
                    Expanded(
                        flex: 50,
                        child: Text(
                          "Cancel",
                          style: TextStyle(fontSize: 14),
                        )),
                    Spacer(
                      flex: 10,
                    )
                  ],
                )),
            Spacer(
              flex: 20,
            )
          ],
        ),
      ),
    );
  }
}
