import 'package:flutter/material.dart';

class ConfirmContainer extends StatefulWidget {
  const ConfirmContainer({super.key});

  @override
  State<ConfirmContainer> createState() => _ConfirmContainerState();
}

class _ConfirmContainerState extends State<ConfirmContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Spacer(
                    flex: 5,
                  ),
                  Expanded(flex: 30, child: Icon(Icons.person_add)),
                  Spacer(
                    flex: 5,
                  ),
                  Expanded(
                      flex: 50,
                      child: Text(
                        "Confirm",
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
    );
  }
}
