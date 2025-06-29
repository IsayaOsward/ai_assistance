import 'dart:convert';
import 'dart:developer' as d;

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<String> callOpenRouterAPI(String message) async {
  final String apiKey = dotenv.env['OPENROUTER_API_KEY']!;
  const String apiUrl = "https://openrouter.ai/api/v1/chat/completions";
  final headers = {
    'Authorization': "Bearer $apiKey",
    "Content-Type": 'application/json',
    'HTTP-Referer': "http://example.com",
    'X-Title': "AI Chat Assistance",
  };

  final body = jsonEncode({
    'model': 'qwen/qwq-32b:free',
    'messages': [
      {"role": "system", "content": "You are a helpful AI Assistant"},
      {"role": "user", "content": message},
    ],
    'max_token': 2000,
    'temperature': 0.7,
  });

  final url = Uri.parse(apiUrl);
  final response = await http.post(url, headers: headers, body: body);
  d.log("========================================${response.body}");
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    d.log("========================================$data");
    return data['choices'][0]['message']['content'];
  } else {
    throw Exception("Failed to load response: ${response.statusCode}");
  }
}
