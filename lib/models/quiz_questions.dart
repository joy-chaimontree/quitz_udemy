class QuizQuestions {
  const QuizQuestions(this.txt, this.answer);

  final String txt;
  final List<String> answer;

  List<String> getShuffledAnswer() {
    final shuffledList = List.of(answer);
    shuffledList.shuffle();
    return shuffledList;
  }
}
