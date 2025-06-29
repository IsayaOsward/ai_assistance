import 'package:flutter/material.dart';

Widget buildAvatar(bool isUser) {
  return Container(
    height: 32,
    width: 32,
    decoration: BoxDecoration(
      gradient: isUser
          ? LinearGradient(colors: [Color(0xFF667EEA), Color(0xFF667EEA)])
          : LinearGradient(colors: [Color(0xFF11998A), Color(0x0ff38efd)]),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Icon(isUser ? Icons.person : Icons.smart_toy, color: Colors.white),
  );
}
