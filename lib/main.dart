import 'package:flutter/material.dart'; // Importamos o pacote Flutter de Material Design para fornecer widgets e ferramentas
import 'sobre.dart'; // Importa o arquivo sobre.dart para conseguir redirecionar a pagina
import 'amor.dart'; // Importa o arquivo amor.dart para conseguir redirecionar a pagina
import 'desculpas.dart'; // Importa o arquivo desculpas.dart para conseguir redirecionar a pagina
import 'aniversario.dart'; // Importa o arquivo desculpas.dart para conseguir redirecionar a pagina

void main() {
  runApp(
    MyApp(),
  ); // Chamamos a função principal que inicia o aplicativo
}

class MyApp extends StatelessWidget {
  // Definimos como classe imutavel chamada MyApp.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
      title:
          'Damata\'s Flores', //título do aplicativo que aparecerá na barra de título.
      home: Scaffold(
        body: MyHomePage(),
      ), 
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple,
      ), // Define a cor de fundo do Container como roxo.
      child: Center(
        // Centraliza o conteúdo dentro do Container
        child: Column(
          // Cria uma coluna para empilhar widgets
          mainAxisAlignment:
              MainAxisAlignment
                  .center, // Definimos o alinhamento da coluna como centralizado
          children: [
            // Lista de widgets filhos dentro da coluna
            // Logo
            Container(
              margin:
                  EdgeInsets.only(), // Adiciona uma margem superior de 20 pixels.
              child: Column(
                // Cria uma nova coluna para organizar a imagem e o texto da logo.
                children: [
                  // Imagem
                  Container(
                    margin:
                        EdgeInsets.only(), // Adiciona uma margem superior de 20 pixels à imagem.
                    child: Image.asset(
                      'assets/images/logodamatas.png', // Caminha do arquivo da logo da empresa
                      height: 380, // altura da imagem
                    ),
                  ),
                ],
              ),
            ),
            // Título
            SizedBox(
              height: 2,
            ), // Adiciona um espaço vertical de 0 pixels entre a logo e o título.
            Text(
              "FAÇA JÁ O SEU PEDIDO", // Texto do título.
              style: TextStyle(
                fontSize: 27, // Define o tamanho da fonte como 24.
                fontWeight:
                    FontWeight.bold, // Define o peso da fonte como negrito.
                color: Colors.white, // Define a cor do título como branco.
              ),
            ),

            Text(
              "Para cada ocasião", // Texto explicativo.
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ), //
            ),
            // Botões
            SizedBox(
              height: 15,
            ), // espaço vertical de 30 pixels antes dos botões.
            Column(
              //coluna para organizar os botões verticalmente.
              children: [
                _buildButton(
                  'Amor',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                Amor(), // Redireciona para a página Amor
                      ),
                    );
                  },
                ),
                // Chama a função _buildButton para criar o botão "Amor".
                _buildButton(
                  'Desculpas',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                Desculpas(), // Redireciona para a página Amor
                      ),
                    );
                  },
                ), // Chama a função _buildButton para criar o botão "Desculpas".
                _buildButton(
                  'Aniversário',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                Aniversario(), // Redireciona para a página Amor
                      ),
                    );
                  },
                ), // Chama a função _buildButton para criar o botão "Aniversário".
                _buildButton(
                  'Sobre nós',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SobrePage(),
                      ), // Redireciona para a página Sobre
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String title, {VoidCallback? onPressed}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: ElevatedButton(
        onPressed:
            onPressed ??
            () {}, // Executa o onPressed passado ou uma função vazia
        child: Text(
          title,
          style: TextStyle(fontSize: 18, color: Colors.purple),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
