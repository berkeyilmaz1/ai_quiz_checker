import 'dart:convert';

import 'package:google_generative_ai/google_generative_ai.dart';

final class GeminiHelper {
  GeminiHelper(String apiKey)
      : model = GenerativeModel(
          model: modelName,
          apiKey: apiKey,
          generationConfig: GenerationConfig(
            responseMimeType: responseType,
            responseSchema: Schema.object(
              properties: {
                accuracyRate: Schema.number(
                  description: accuracyRateDescription,
                  format: 'double',
                  nullable: false,
                ),
                bestAnswer: Schema.string(
                  description: bestAnswerDescription,
                  nullable: false,
                ),
                resources: Schema.string(
                  description: resourcesDescription,
                  nullable: false,
                ),
              },
              requiredProperties: [
                accuracyRate,
                bestAnswer,
                resources,
              ],
            ),
          ),
        );
  static const modelName = 'gemini-1.5-flash';
  static const responseType = 'application/json';
  static const accuracyRate = 'accuracyRate';
  static const bestAnswer = 'bestAnswer';
  static const resources = 'resources';

  static const accuracyRateDescription =
      "The accuracy rate of the user's answer compared to the actual answer to the question.";
  static const bestAnswerDescription =
      'The best possible answer to the question.';
  static const resourcesDescription =
      'A list of reliable sources to learn more.';

  final GenerativeModel model;

  Future<dynamic> evaluateAnswer(
    String question,
    String userAnswer,
  ) async {
    final promptForResources = '''
      Question: "$question".
      User's answer: "$userAnswer".
      Please evaluate the accuracy of the user's answer to the question in percentage and provide the best possible answer.
      Provide a list of reliable sources to learn more about the following question: "$question".
      The sources should include websites, books, or articles that provide thorough and trustworthy information.
      Present the recommended sources in a short bullet-point format. The answers should be provided in Turkish. 
      The sources should be compatible with the Turkish educational curriculum.''';

    final response =
        await model.generateContent([Content.text(promptForResources)]);

    return decodeResponse(response);
  }

  dynamic decodeResponse(GenerateContentResponse response) {
    final responseMap = jsonDecode(response.text!) as Map<String, dynamic>;
    final accuracyRate = responseMap['accuracyRate'];
    final bestAnswer = responseMap['bestAnswer'];
    final resources = responseMap['resources'];
    return {
      'accuracyRate': accuracyRate,
      'bestAnswer': bestAnswer,
      'resources': resources,
    };
  }
}
