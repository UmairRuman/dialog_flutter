import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCircleAvatar extends StatelessWidget {
  final imageUrl =
      "https://unsplash.com/photos/an-orange-plate-with-a-black-border-on-a-white-background-yExo1i3mKT8";
  const MyCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.sizeOf(context).height / 2 -
          450, // Adjust this value to position the avatar half above
      right: MediaQuery.sizeOf(context).width / 2 - 50,
      child: Container(
        height: 100,
        width: 100,
        decoration: const BoxDecoration(
          color: Colors.amber,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.grey,
            ),
          ],
        ),
        child: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
