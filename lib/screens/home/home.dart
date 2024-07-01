import 'package:flutter/material.dart';
import 'package:la_barbearia/screens/shared/custom_appbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context){
   return Scaffold(
      appBar: customAppBar('La Barbearia'),
      drawer: Drawer(child: Column(children: [],),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar (
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Minha Conta',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notification_add),
          label: 'Notificação',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.lock_clock),
          label: 'Agendamento',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Menu',
        ),
      ],
    ),
   
   );
  }
}