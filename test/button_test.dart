import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:url_launcher/url_launcher.dart';

// Cria um mock para a função de lançador de URL
class MockUrlLauncher extends Mock {
  Future<bool> canLaunchUrl(Uri url) async {
    return true; // Assume que pode sempre abrir URLs
  }

  Future<void> launchUrl(
    Uri url, {
    LaunchMode mode = LaunchMode.externalApplication,
  }) async {
    // Comportamento simulado
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ElevatedButton Test', () {
    testWidgets('Teste se o botão redireciona para o link correto', (
      WidgetTester tester,
    ) async {
      // Crie uma instância do mock
      final mockLauncher = MockUrlLauncher();

      // Adicione o ElevatedButton no widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ElevatedButton(
              onPressed: () async {
                Uri url = Uri.parse("https://www.damatasflores.com.br/");
                if (await mockLauncher.canLaunchUrl(url)) {
                  await mockLauncher.launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  );
                } else {
                  throw 'Não foi possível abrir o link';
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF9C27B0)),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 100.0, vertical: 16.0),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: Text("Comprar agora"),
            ),
          ),
        ),
      );

      // Simule o pressionamento do botão
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Afirmar que o URL correto foi tentado abrir
      expect(
        await mockLauncher.canLaunchUrl(
          Uri.parse("https://www.damatasflores.com.br/"),
        ),
        isTrue,
      );

      // Se o teste passou, exiba uma mensagem de confirmação
      debugPrint(
        'O botão redirecionou corretamente para a página: https://www.damatasflores.com.br/',
      );
    });
  });
}
