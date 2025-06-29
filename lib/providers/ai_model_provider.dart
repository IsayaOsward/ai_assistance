import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:toastification/toastification.dart';

class AiModelProvider extends ChangeNotifier {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static const String _selectedModelKey = 'preferred_model_index';

  int preferredModelIndex = 0;
  List<Map<String, dynamic>> aiModels = [
    {
      "name": "DeepSeek: R1",
      "source": "DeepSeek",
      "model": "deepseek/deepseek-r1:free",
    },
    {"name": "Qwen: QwQ 32B", "source": "Qwen", "model": "qwen/qwq-32b:free"},
    {
      "name": "MiniMax: MiniMax M1",
      "source": "Anthropic",
      "model": "minimax/minimax-m1:extended",
    },
    {
      "name": "DeepSeek: DeepSeek V3",
      "source": "DeepSeek team",
      "model": "deepseek/deepseek-chat-v3:free",
    },
    {
      "name": "Mistral: Mistral Small 3.2 24B",
      "source": "Mistral AI",
      "model": "mistralai/mistral-small-3.2-24b-instruct-2506:free",
    },
    {
      "name": "Meta: Llama 3.2 3B Instruct",
      "source": "Meta Team",
      "model": "meta-llama/llama-3.2-3b-instruct",
    },
  ];

  void changeSelectedModel({required int modelIndex}) async {
    preferredModelIndex = modelIndex;
    await _secureStorage.write(key: _selectedModelKey, value: "$modelIndex");
    toastification.show(
      alignment: Alignment.bottomCenter,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Model Changed Successfully!'),
          Text('The chosen model is ${aiModels[modelIndex]['name']}'),
        ],
      ),
      showProgressBar: true,
      style: ToastificationStyle.fillColored,
      primaryColor: Color(0xff764ba2),
      autoCloseDuration: const Duration(seconds: 3),
    );

    notifyListeners();
  }

  void retriveLastModelIndex() async {
    String index = await _secureStorage.read(key: _selectedModelKey) ?? "0";
    preferredModelIndex = int.parse(index);
    notifyListeners();
  }
}
