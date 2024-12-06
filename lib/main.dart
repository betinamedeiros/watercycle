import 'package:flutter/material.dart';


void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WaterApp',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _observacaoController = TextEditingController();
  List<String> _observacoes = [];

  void _adicionarObservacao() {
    final observacao = _observacaoController.text;
    if (observacao.isNotEmpty) {
      setState(() {
        _observacoes.add(observacao);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Observação adicionada: $observacao')),
      );
      _observacaoController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, insira uma observação.')),
      );
    }
  }

  void _removerObservacao(int index) {
    setState(() {
      _observacoes.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Observação removida')),
    );
  }

  void _ligarIrrigacao() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Irrigação ligada!')),
    );
  }

  void _desligarIrrigacao() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Irrigação desligada!')),
    );
  }

  void _visualizarAviso() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AvisoScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200]!,
        toolbarHeight: 120,
        title: Center(
          child: Text(
            'Olá, Betina!',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      backgroundColor: Colors.blue[100]!,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _ligarIrrigacao,
                  child: Text('Ligar Irrigação'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _desligarIrrigacao,
                  child: Text('Desligar Irrigação'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              elevation: 7,
              child: ListTile(
                title: Text('Última irrigação', style: TextStyle(fontWeight: FontWeight.bold)),
                leading: Icon(Icons.calendar_month_sharp, color: Colors.red),
                subtitle: Row(
                  children: [
                    Icon(Icons.access_time,),
                    SizedBox(width: 7),
                    Text('31/10 10:30', style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),

            Card(
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              color: Colors.blue[200]!,
              child: ListTile(
                title: Column(
                  children: [
                    Text('Previsão em ibirubá', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 90),
                    Text('70% de chances de chuva', style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20.0),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              color: Colors.blue[200]!,
              child: ListTile(
                title: Row(
                  children: [
                    Text('Tempo ideal da irrigação ', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 90),
                    Text('20min', style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                title: Text('Adicionar observação sobre a irrigação:', style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 8.0),
                      child: TextField(
                        controller: _observacaoController,
                        decoration: const InputDecoration(
                          hintText: "Insira as observações",
                          prefixIcon: Icon(Icons.add, color: Colors.blue),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _adicionarObservacao,
                      child: Text('Adicionar Observação'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ListTile(
                title: Text('Observações:', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Container(
                  height: 100,
                  child: ListView.builder(
                    itemCount: _observacoes.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_observacoes[index]),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _removerObservacao(index),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Destaques', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0,),)
              ],
            ),
            SizedBox(height: 17.0),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 25.0),
              color: Colors.pinkAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                  leading: Icon(Icons.warning, color: Colors.white),
                  title: Text('Perigos de uma irrigação exagerada', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,),),
                  trailing: TextButton(
                    onPressed: _visualizarAviso,
                    child: Text('Visualizar', style: TextStyle(color: Colors.white, decoration: TextDecoration.underline,)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 25.0),
              color: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                  leading: Icon(Icons.check, color: Colors.white),
                  title: Text('Benefícios', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,),),
                  subtitle: Text('Elevada eficiência de aplicação, como a água é aplicada diretamente na raiz, ocorrem poucas perdas por evaporação;',
                    style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                leading: Icon(Icons.phone),
                title: Text('Contatos', style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('WhatsApp: (54)9911111-1111'),
                    SizedBox(height: 5),
                    Text('Instagram: @Water_cycle'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 100.0),
          ],
        ),
      ),
    );
  }
}

class AvisoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perigos de Irrigação Exagerada'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'A irrigação exagerada pode causar diversos problemas, incluindo:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('- Encharcamento do solo'),
            Text('- Perda de nutrientes'),
            Text('- Aumento do custo com água'),
            Text('- Danos às raízes das plantas'),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
