import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // incluimos a classe MyApp
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App', // Título do aplicativo
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Desculpas(), // Inicializa a classe amor
    );
  }
}

class Desculpas extends StatelessWidget {
  const Desculpas({super.key});

  //definimos a classe
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //cabecalho da pagina NAVBAR
        backgroundColor: Color.fromARGB(255, 255, 0, 153), //cor do fundo
        title: Text(
          "Desculpas",
          style: TextStyle(color: Colors.white), // cor do titulop
        ),
        iconTheme: IconThemeData(
          color:
              Colors
                  .white, // definimos a cor do widget setinha no navbar para acompanhar cor do texto
        ),
      ),
      body: PageView(
        children: [
          //filhos
          ProductCard(
            title: "Rosas vermelhas com girassol + chocolate",
            description:
                "rosas vermelhas representam a paixão ardente e girassóis trazem uma alegria vibrante e um sorriso contagiante. Juntos, eles formam a combinação ideal para iluminar o dia de quem você ama.",
            price: "\$150.00",
            imageUrl:
                "assets/images/amor2.png", //caminho da imagem 2 dentro do projeto
          ),
        ],
      ),
    );
  }
}

// especificacao das classes com estado imutavel
class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String imageUrl;

  const ProductCard({super.key, 
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0), //definicao da margem
      child: Column(
        //especificacao do widget como coluna
        children: [
          Image.asset(
            //imagem do card
            imageUrl,
            height: 300, // especificamos o tamanho da imagem
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              //estilizacao do titulo dentro do card
              title,
              style: TextStyle(
                fontSize: 24, //tamanho da fonte escolhida
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 18,
              ), //estilizacao do texto complementar dentro do card
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              price,
              style: TextStyle(
                fontSize: 20,
                color: Colors.green,
              ), // Aumentando o tamanho texto que exibe o preço do produto
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // parametro que aceeita a funcao de clicar no botao
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                Color(0xFF9C27B0),
              ), // Cor de fundo do botão
              foregroundColor: WidgetStateProperty.all(
                Colors.white,
              ), // Cor do texto
              padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(horizontal: 100.0, vertical: 16.0),
              ), // Preenchimento
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ), // Cantos arredondados
                ),
              ),
            ),
            child: Text("Comprar agora"), //chamada para a acao
          ),
        ],
      ),
    );
  }
}
