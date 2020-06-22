class QuizBrain {
  List<Question> questions = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
  ];
  List<bool> score = [];
  int questionNum = 0;
  bool isFinished = false;

  String getQuestionText() {
    return questions[questionNum].questionText;
  }

  Question nextQuestion() {
    if (questionNum < questions.length - 1) {
      questionNum++;
    } else {
      isFinished = true;
    }
  }

  void addCorrect() => score.add(true);
  void addWrong() => score.add(false);
  void checkAnswer(bool answer) {
    if (isFinished) {
      return;
    }
    questions[questionNum].isCorrect(answer: answer)
        ? addCorrect()
        : addWrong();
    nextQuestion();
  }

  void reset() {
    score = [];
    questionNum = 0;
    isFinished = false;
  }
}

class Question {
  String questionText;
  bool correctAnswer;
  Question(this.questionText, this.correctAnswer);

  bool isCorrect({bool answer}) => correctAnswer == answer;
}
