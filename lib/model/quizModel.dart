class Quiz {
  final String FullName;
  final int Score;

  Quiz({required this.FullName, required this.Score});

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(FullName: json['question'], Score: json['solution']);
  }
}
