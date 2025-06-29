import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<String> callOpenRouterAPI({
  required String message,
  required String currentModel,
}) async {
  final String apiKey = dotenv.env['OPENROUTER_API_KEY']!;
  const String apiUrl = "https://openrouter.ai/api/v1/chat/completions";
  final headers = {
    'Authorization': "Bearer $apiKey",
    "Content-Type": 'application/json',
    'HTTP-Referer': "http://example.com",
    'X-Title': "AI Chat Assistance",
  };

  final body = jsonEncode({
    'model': currentModel,
    'messages': [
      {"role": "system", "content": "You are a helpful AI Assistant"},
      {"role": "user", "content": message},
    ],
    'max_token': 2000,
    'temperature': 0.7,
  });

  final url = Uri.parse(apiUrl);
  final response = await http.post(url, headers: headers, body: body);
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['choices'][0]['message']['content'];
  } else {
    throw Exception("Failed to load response: ${response.statusCode}");
  }
}
