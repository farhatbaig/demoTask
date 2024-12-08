import 'package:excel_acedmy/presentation/splashPage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:excel_acedmy/main.dart';

void main() {
  testWidgets('SplashPage loads correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(SplashPage), findsOneWidget);

    expect(find.text('Excel Academy'), findsNothing); 
  });
}
