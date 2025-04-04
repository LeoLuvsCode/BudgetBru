import 'package:flutter/material.dart';
import '../models/savings_goal.dart';
import '../widgets/savings_card.dart';

class SavingsScreen extends StatelessWidget {
  final List<SavingsGoal> goals = [  // Removed const from initialization
    SavingsGoal(
      id: '1',
      name: 'Rage Festival',
      emoji: '🍻',
      targetAmount: 5000,
      savedAmount: 1200,
      targetDate: DateTime(2026, 4, 1),
    ),
    SavingsGoal(
      id: '2',
      name: 'New Laptop',
      emoji: '💻',
      targetAmount: 15000,
      savedAmount: 3500,
    ),
  ];

  SavingsScreen({super.key});  // Removed const from constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Savings Goals')),
      body: ListView.builder(
        itemCount: goals.length,
        itemBuilder: (ctx, index) => SavingsCard(goal: goals[index]),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showAddGoalDialog(context),
      ),
    );
  }

  void _showAddGoalDialog(BuildContext context) {
    final nameController = TextEditingController();
    final amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('New Savings Goal'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Goal Name'),
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(labelText: 'Target Amount (R)'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Add validation and saving logic here
              Navigator.pop(ctx);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}