import 'dart:convert';
import 'package:http/http.dart' as http;

class Gpt {
  Future<String> getData(String prompt) async {
    String link = "https://api.openai.com/v1/chat/completions";
    var uri = Uri.parse(link);
    var header = {
      "Content-Type": "application/json",
      "Authorization":
          "Bearer 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"
    };
    var body = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "system", "content": "You are a helpful assistant."},
        {"role": "user", "content": prompt}
      ]
    };
    var request = await http.post(
      uri,
      headers: header,
      body: json.encode(body),
    );
    var response = json.decode(request.body);
    String content = response["choices"][0]["message"]["content"];
    print(content);
    return content;
  }
}
