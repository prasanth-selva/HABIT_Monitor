class AppTransaction {
  final String id;
  final String title;
  final double amount; // Positive = Income, Negative = Expense
  final String account;
  final String category;
  final DateTime timestamp;

  const AppTransaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.account,
    required this.category,
    required this.timestamp,
  });
}
