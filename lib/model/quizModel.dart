class Quiz {
  final String FullName;
  final int Score;
  final int timetaken;

  Quiz({required this.FullName, required this.Score, required this.timetaken});

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
        FullName: json['question'],
        Score: json['solution'],
        timetaken: json['Time Taken']);
  }
}
