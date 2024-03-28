import 'package:flutter/material.dart';

class ThankYouInterest extends StatelessWidget {
  const ThankYouInterest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            color: Colors.orange,
          ),
          Text(
            'Thank You',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.yellow.shade800),
          ),
          const Text(
            'for showing your interest',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          const Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Our team will contact you shortly in 2-3 days',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
