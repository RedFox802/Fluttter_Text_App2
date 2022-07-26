import 'package:flutter/material.dart';

class GeneralScreen extends StatelessWidget {
  const GeneralScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 4),
          child: Column(
            children: [
              const Text(
                'Выберите нужный функционал',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.height / 12,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Просмотр видео',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.height / 12,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Работа с файлами',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
                width: MediaQuery.of(context).size.width / 4,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Сокеты',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
