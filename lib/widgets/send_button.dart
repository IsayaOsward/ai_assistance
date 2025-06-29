import 'package:flutter/material.dart';

Widget buildInputArea({required bool isLoading, required TextEditingController messageController, required VoidCallback sendMessage}) {
  return Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(color: Colors.transparent),
    child: Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(25),
            ),
            child: TextField(
              controller: messageController,
              onSubmitted: (value) {
                sendMessage();
              },
              style: TextStyle(color: Colors.white, fontSize: 16),
              decoration: InputDecoration(
                hintText: "Type your message ...",
                hintStyle: TextStyle(color: Colors.white70, fontSize: 16),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 16),
        GestureDetector(
          onTap: isLoading ? null : sendMessage,
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  if (isLoading) ...[
                    Color(0xff667eea),
                    Color(0xff764ba2),
                  ] else ...[
                    Color(0xff38ef7d),
                    Color(0xff11998e),
                  ],
                ],
              ),
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff667eea).withOpacity(0.3),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              isLoading ? Icons.hourglass_bottom : Icons.send_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ],
    ),
  );
}

