import 'dart:convert';

import 'package:ai_quiz_checker/features/questions/gemini_constants.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

final class GeminiHelper {
  GeminiHelper(String apiKey)
      : model = GenerativeModel(
          model: GeminiConstants.modelName,
          apiKey: apiKey,
          generationConfig: GenerationConfig(
            responseMimeType: GeminiConstants.responseType,
            responseSchema: Schema.object(
              properties: {
                GeminiConstants.accuracyRate: Schema.number(
                  description: GeminiConstants.accuracyRateDescription,
                  format: 'double',
                  nullable: false,
                ),
                GeminiConstants.bestAnswer: Schema.string(
                  description: GeminiConstants.bestAnswerDescription,
                  nullable: false,
                ),
                GeminiConstants.resources: Schema.string(
                  description: GeminiConstants.resourcesDescription,
                  nullable: false,
                ),
              },
              requiredProperties: [
                GeminiConstants.accuracyRate,
                GeminiConstants.bestAnswer,
                GeminiConstants.resources,
              ],
            ),
          ),
        );

  final GenerativeModel model;

  Future<dynamic> evaluateAnswer(
    String question,
    String userAnswer,
  ) async {
    final promptForResources = GeminiConstants.mainPrompt(question, userAnswer);

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
