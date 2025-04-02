import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // incluimos a classe MyApp
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App', // Título do aplicativo
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Amor(), // Inicializa a classe amor
    );
  }
}

class Amor extends StatelessWidget {
  //definimos a classe
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //cabecalho da pagina NAVBAR
        backgroundColor: Color(0xFF9C27B0), //cor do fundo
        title: Text(
          "Amor",
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
            title: "Buque de Rosas Vermelhas", //titulo do produto do card
            description: //texto informativo do card
                "Surpreenda quem você ama com o presente perfeito! Nosso buquê de rosas vermelhas, símbolo eterno do amor e da paixão, é delicadamente arranjado para transmitir sua sinceridade e afeto. Cada rosa foi selecionada a dedo, garantindo a máxima frescura e vivacidade, pronta para iluminar o dia de alguém especial.",
            price: "\$100.00", //valor do produto
            imageUrl:
                "assets/images/amor1.png", // url da imagem do produto dentro do projeto
          ),
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

  ProductCard({
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
            onPressed: () async {
              Uri url = Uri.parse("https://www.damatasflores.com.br/");
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              } else {
                throw 'Não foi possível abrir o link';
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Color(0xFF9C27B0),
              ), // Cor de fundo do botão
              foregroundColor: MaterialStateProperty.all(
                Colors.white,
              ), // Cor do texto
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(horizontal: 100.0, vertical: 16.0),
              ), // Preenchimento
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ), // Cantos arredondados
                ),
              ),
            ),
            child: Text("Comprar agora"), // Chamada para a ação
          ),
        ],
      ),
    );
  }
}
