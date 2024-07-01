import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La Barbearia',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(title: 'La Barbearia'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<Barber> _barbers = [
    Barber(
      imageUrl: 'assets/barber1.png',
      price: 'R\$30,00',
      waitTime: '15 min',
      location: 'Rua A, 123',
    ),
    Barber(
      imageUrl: 'assets/barber2.png',
      price: 'R\$40,00',
      waitTime: '20 min',
      location: 'Rua B, 456',
    ),
    Barber(
      imageUrl: 'assets/barber3.png',
      price: 'R\$50,00',
      waitTime: '30 min',
      location: 'Rua C, 789',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addBarber(Barber barber) {
    setState(() {
      _barbers.add(barber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.message),
          onPressed: () {
            // Adicione ação aqui para o ícone de mensagens
            print('mensagens');
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Adicione ação aqui para o ícone de menu
              print('Menu');
            },
          ),
        ],
      ),
      body: Center(
        child: _getPage(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Agendamento',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddBarberDialog(context);
        },
        tooltip: 'Adicionar Barbearia',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return _buildBarberList();
      case 1:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Agendamento',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        );
      case 2:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Menu',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        );
      default:
        return Center(
          child: Text(
            'Página não encontrada',
            style: TextStyle(fontSize: 24),
          ),
        );
    }
  }

  Widget _buildBarberList() {
    return ListView(
      children: _barbers.map((barber) {
        return BarberRow(
          imageUrl: barber.imageUrl,
          price: barber.price,
          waitTime: barber.waitTime,
          location: barber.location,
        );
      }).toList(),
    );
  }

  void _showAddBarberDialog(BuildContext context) {
    final _imageUrlController = TextEditingController();
    final _priceController = TextEditingController();
    final _waitTimeController = TextEditingController();
    final _locationController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Adicionar Barbearia'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _imageUrlController,
                decoration: InputDecoration(labelText: 'URL da Imagem'),
              ),
              TextField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Preço'),
              ),
              TextField(
                controller: _waitTimeController,
                decoration: InputDecoration(labelText: 'Tempo de Espera'),
              ),
              TextField(
                controller: _locationController,
                decoration: InputDecoration(labelText: 'Localização'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              final newBarber = Barber(
                imageUrl: _imageUrlController.text,
                price: _priceController.text,
                waitTime: _waitTimeController.text,
                location: _locationController.text,
              );
              _addBarber(newBarber);
              Navigator.of(context).pop();
            },
            child: Text('Adicionar'),
          ),
        ],
      ),
    );
  }
}

class BarberRow extends StatelessWidget {
  final String imageUrl;
  final String price;
  final String waitTime;
  final String location;

  BarberRow({
    required this.imageUrl,
    required this.price,
    required this.waitTime,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.network(
            imageUrl,
            width: 50,
            height: 50,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.broken_image, size: 50);
            },
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(price, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('Espera: $waitTime'),
            ],
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () {
              // Lógica para mostrar a localização da barbearia
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Localização da Barbearia'),
                  content: Text(location),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Fechar'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Barber {
  final String imageUrl;
  final String price;
  final String waitTime;
  final String location;

  Barber({
    required this.imageUrl,
    required this.price,
    required this.waitTime,
    required this.location,
  });
}
