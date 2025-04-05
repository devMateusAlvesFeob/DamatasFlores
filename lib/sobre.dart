import 'package:flutter/material.dart'; //importamos o material esigner para o nosso projeto

class SobrePage extends StatelessWidget {
  //criamos a classe sobrepage, que fala sobre a empresa
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //definimos a estrutura basica do layolt
      appBar: AppBar(
        //estiliozamos o navbar da pagina
        backgroundColor: Color(0xFF9C27B0),
        title: Text(
          "Sobre nós",
          style: TextStyle(color: Colors.white), // cor do titulo
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // Define a cor do widget setinha como branca
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(
            16.0,
          ), // criamos um espaço ao redor do texto
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment
                    .center, // Centralizamos a coluna verticalmente
            crossAxisAlignment:
                CrossAxisAlignment.center, //textos horizontalmente
            children: [
              Text(
                "Damatas Flores Razão Social - CNPJ/MF SOB O N° 21.949.891/0001-05", // Texto sobre a empresa
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 50), // Espaço entre os textos
              Text(
                "Projeto integrado - Desenvolvimento Mobile", // titulo do projeto
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 20),
              Text(
                "Membros da equipe:", //Membros da equipe
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 128, 0, 150),
                ), // Cor verde
              ),
              Text(
                "Theodoro da Mata, 1012022201071",
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 14),
              ),
              Text(
                "Leonardo Lopes Caetano, 1012023100049",
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 14),
              ),
              Text(
                "Alan Cesar Pereira, 1012023100411",
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 14),
              ),
              Text(
                "Mateus Alves, 1012023100575",
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
