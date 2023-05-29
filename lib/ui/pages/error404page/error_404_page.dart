import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Error404Page extends StatelessWidget {
  const Error404Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Страница не найдена'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Ошибка 404',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(216, 89, 70, 41),
            fontSize: 26,
          ),
        ),
      ),
    );
  }
}
