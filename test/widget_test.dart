import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart'; // Certifique-se de que o caminho esteja correto.

void main() {
  testWidgets('Calculadora - Testando operações', (WidgetTester tester) async {
    // Constrói o app.
    await tester.pumpWidget(MyApp());

    // Verifica se os campos de entrada e os botões existem.
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text('+'), findsOneWidget);
    expect(find.text('-'), findsOneWidget);
    expect(find.text('*'), findsOneWidget);
    expect(find.text('/'), findsOneWidget);

    // Insere números nos campos de texto.
    await tester.enterText(find.byType(TextField).at(0), '10');
    await tester.enterText(find.byType(TextField).at(1), '5');

    // Testa a operação de soma.
    await tester.tap(find.text('+'));
    await tester.pump();
    expect(find.text('Resultado: 15.0'), findsOneWidget);

    // Testa a operação de subtração.
    await tester.tap(find.text('-'));
    await tester.pump();
    expect(find.text('Resultado: 5.0'), findsOneWidget);

    // Testa a operação de multiplicação.
    await tester.tap(find.text('*'));
    await tester.pump();
    expect(find.text('Resultado: 50.0'), findsOneWidget);

    // Testa a operação de divisão.
    await tester.tap(find.text('/'));
    await tester.pump();
    expect(find.text('Resultado: 2.0'), findsOneWidget);

    // Testa a divisão por zero.
    await tester.enterText(find.byType(TextField).at(1), '0');
    await tester.tap(find.text('/'));
    await tester.pump();
    expect(find.text('Erro: Divisão por zero.'), findsOneWidget);
  });
}
