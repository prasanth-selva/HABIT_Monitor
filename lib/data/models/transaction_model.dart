import 'package:hive/hive.dart';
import '../../domain/entities/transaction.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 4)
class TransactionModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final double amount;

  @HiveField(3)
  final String account;

  @HiveField(4)
  final String category;

  @HiveField(5)
  final DateTime timestamp;

  TransactionModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.account,
    required this.category,
    required this.timestamp,
  });

  factory TransactionModel.fromEntity(AppTransaction entity) {
    return TransactionModel(
      id: entity.id,
      title: entity.title,
      amount: entity.amount,
      account: entity.account,
      category: entity.category,
      timestamp: entity.timestamp,
    );
  }

  AppTransaction toEntity() {
    return AppTransaction(
      id: id,
      title: title,
      amount: amount,
      account: account,
      category: category,
      timestamp: timestamp,
    );
  }
}
