import 'package:flutter_test/flutter_test.dart';
import 'package:giftstoreapp_flutter/main.dart';

void main() {
  testWidgets('Gift Store app loads smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const GiftStoreApp());

    expect(find.text('Gift Store'), findsOneWidget);
  });
}