class SavingsGoal {
  final String id;
  final String name;
  final String emoji;
  final double targetAmount;
  final double savedAmount;
  final DateTime? targetDate;
  final List<String> contributors;

  SavingsGoal({
    required this.id,
    required this.name,
    this.emoji = '🎯',
    required this.targetAmount,
    this.savedAmount = 0,
    this.targetDate,
    this.contributors = const [],
  });

  double get progress => (savedAmount / targetAmount).clamp(0, 1);
  String get progressText => '${(progress * 100).toStringAsFixed(0)}%';

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'emoji': emoji,
        'targetAmount': targetAmount,
        'savedAmount': savedAmount,
        'targetDate': targetDate?.toIso8601String(),
        'contributors': contributors,
      };

  factory SavingsGoal.fromJson(Map<String, dynamic> json) => SavingsGoal(
        id: json['id'] as String,
        name: json['name'] as String,
        emoji: json['emoji'] as String,
        targetAmount: json['targetAmount'] as double,
        savedAmount: json['savedAmount'] as double,
        targetDate: json['targetDate'] != null
            ? DateTime.parse(json['targetDate'] as String)
            : null,
        contributors: List<String>.from(json['contributors'] as List),
      );
}