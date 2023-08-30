import 'package:flutter/material.dart';

class DetailLink extends StatelessWidget {
  const DetailLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(1, 2),
            color: Colors.black12)
      ]),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "https://app.bitly.com/Bn3m8",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Spacer(),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.copy),
                  label: const Text("Copy"))
            ],
          ),
          Row(
            children: [
              Icon(Icons.subdirectory_arrow_right),
              SizedBox(
                width: 10,
              ),
              Text("https://app.bitly.com/Bn3m8g13yYv/bitlinks/3KGpyPR/details")
            ],
          )
        ],
      ),
    );
  }
}
