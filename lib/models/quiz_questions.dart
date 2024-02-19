class QuizQuestion{
  const QuizQuestion({required this.text, required this.answers});

  // instance variables / properties
  final String text;
  final List<String> answers;

  // We shuffle the list but we create a copy of the original list in order not to change the original 
  List<String> getShuffledAnswers(){
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}