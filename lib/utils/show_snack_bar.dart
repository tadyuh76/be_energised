import 'package:be_energised/constants/palette.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).clearSnackBars();

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.fixed,
      content: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 40,
            child: Container(
              width: 300,
              height: 60,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Palette.grey,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Palette.lightGrey,
                    fontSize: 14,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
