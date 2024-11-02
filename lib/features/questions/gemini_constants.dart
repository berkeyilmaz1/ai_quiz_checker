final class GeminiConstants {
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

  static String mainPrompt(String question, String userAnswer) {
    return '''
      Question: "$question".
      User's answer: "$userAnswer".
      Please evaluate the accuracy of the user's answer to the question in percentage and provide the best possible answer.
      Provide a list of reliable sources to learn more about the following question: "$question".
      The sources should include websites, books, or articles that provide thorough and trustworthy information.
      Present the recommended sources in a short bullet-point format. The answers should be provided in Turkish. 
      The sources should be compatible with the Turkish educational curriculum.''';
  }
}
