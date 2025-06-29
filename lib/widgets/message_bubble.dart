import 'package:flutter/material.dart';
import 'package:gpt_markdown/gpt_markdown.dart';

import '../message.dart';
import 'avatar.dart';

Widget buildMessageBubble({required BuildContext context,required Message message}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 16),
    child: Row(
      mainAxisAlignment: message.isUser
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (!message.isUser) buildAvatar(false),
        SizedBox(width: 8),
        Flexible(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width * 0.75,
            ),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  if (message.isUser) ...[
                    Color(0xff667eea),
                    Color(0xff764ba2),
                  ] else ...[
                    Colors.white.withOpacity(0.1),
                    Colors.white.withOpacity(0.05),
                  ],
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              border: message.isUser
                  ? null
                  : Border.all(color: Colors.white.withOpacity(0.3), width: 1),
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  offset: Offset(0, 2),
                  color: message.isUser
                      ? Color(0xff667eea).withOpacity(0.1)
                      : Colors.black.withOpacity(0.1),
                ),
              ],
            ),
            child: message.isUser
                ? Text(
                    message.content,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                : GptMarkdown(
                    message.content,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
          ),
        ),
        SizedBox(width: 8),
        if (message.isUser) buildAvatar(true),
      ],
    ),
  );
}
