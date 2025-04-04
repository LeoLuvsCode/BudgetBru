import 'package:budget_bru/screens/savings_screen.dart';
import 'package:budget_bru/widgets/savings_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// Ensure this matches pubspec.yaml name

void main() {
  testWidgets('SavingsScreen renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SavingsScreen(),
      ),
    );

    expect(find.text('My Savings Goals'), findsOneWidget);
    expect(find.byType(SavingsCard), findsWidgets);
  });
}