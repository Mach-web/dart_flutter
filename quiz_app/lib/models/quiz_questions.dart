class QuizQuestions{
  const QuizQuestions(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> shuffleAnswers(){
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}