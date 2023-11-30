import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

int? cont;

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("International travel"),
      ),
      body: ListView(
        children: [
          Destino('Roma', "imagens/Roma.jpg", 783, 84),
          Destino('Londres', "imagens/Londres.jpg", 850, 86),
          Destino('Los Angeles', "imagens/Los Angeles.jpg", 650, 95),
          Destino('Santiago', "imagens/Santiago.jpg", 854, 78),
          Destino('Paris', "imagens/Paris.jpg", 950, 110),
          Destino('Las Vegas', "imagens/Las vegas.jpg", 1500, 150),
          Destino('Miami', "imagens/Miami.jpg", 350, 85),
          Destino('Buenos Aires', "imagens/Buenos_Aires.jpg", 250, 56),
          Destino('Nova York', "imagens/Nova York.jpg", 1800, 95),
          Destino('Orlando', "imagens/Orlando.jpg", 357, 80),
        ],
      ),
    );
  }
}

class Destino extends StatefulWidget {
  final String nome;
  final String img;
  final int valord;
  final int valorp;

  const Destino(this.nome, this.img, this.valord, this.valorp, {super.key});

  @override
  State<Destino> createState() => _DestinoState();
}

class _DestinoState extends State<Destino> {
  int n_pessoas = 0;
  int n_dias = 0;
  int total = 0;

  //                                                                                //

  void dias() {
    setState(() {
      n_dias++;
    });
  }

  void pessoas() {
    setState(() {
      n_pessoas++;
    });
  }

  void limpar() {
    setState(() {
      n_dias = 0;
      n_pessoas = 0;
      // calctotal();
      total = 0;
    });
  }

  void calctotal() {
    setState(() {
      total = (n_dias * widget.valord) + (n_pessoas * widget.valorp);
    });
  }

  //                                                                          //
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.black,
            width: 450,
            height: 320,
            child: Image.asset(widget.img, fit: BoxFit.fill),
          ),
          Text(
            widget.nome,
            style: TextStyle(fontSize: 30),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "R\$ ${widget.valord} - Per day - R\$ ${widget.valorp} - Person",
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Number of days: $n_dias",
                style: TextStyle(fontSize: 18),
              ),
              ElevatedButton(
                  onPressed: () {
                    dias();
                  },
                  child: Icon(Icons.add))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Amount of people: $n_pessoas",
                style: TextStyle(fontSize: 18),
              ),
              ElevatedButton(
                  onPressed: () {
                    pessoas();
                  },
                  child: Icon(Icons.add))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Amount: R\$ $total",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  calctotal();
                },
                child: Text(
                  "Calculate",
                  style: TextStyle(fontSize: 29),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  limpar();
                },
                child: Text(
                  "Clean",
                  style: TextStyle(fontSize: 29),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
