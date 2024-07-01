import 'package:flutter/material.dart';

AppBar customAppBar(String appTitle) {
  return AppBar(
    title: Text(appTitle),
    
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.message),
      ),
      PopupMenuButton(
        itemBuilder: (context) => [
          const PopupMenuItem(
            child: Text('Barbearias'),
          ),
          const PopupMenuItem(
            child: Text('Preços'),
          ),
          const PopupMenuItem(
            child: Text('Mapa'),
          ),
          const PopupMenuItem(
            child: Text('Agendar'),
          ),
          const PopupMenuItem(
            child: Text('Adicionar Barbearia'),
          ),
          const PopupMenuItem(
            child: Text('Login/Registro'),
          ),
        ],
      ),
    ],
    
  );
}
