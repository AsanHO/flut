import 'package:flutter/material.dart';
import 'package:flutterdemo/widgets/button.dart';
import 'package:flutterdemo/widgets/currencyCard.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 40, 40, 40),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //빈 박스로 마진 구현
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Welcome",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 33,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "Uno",
                          style: TextStyle(
                            color: Colors.white70.withOpacity(0.7),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Total Balance",
                        style: TextStyle(
                          color: Colors.white70.withOpacity(0.7),
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                  "₩ 520.305.000",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 33,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                        text: "Transfer",
                        bgColor: Colors.pink.shade400,
                        textColor: Colors.black87),
                    const Button(
                        text: "Request",
                        bgColor: Colors.grey,
                        textColor: Colors.white)
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Wallets",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Wallets",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CurrencyCard(
                  name: "Euro",
                  code: "EUR",
                  amount: "6,428",
                  icon: Icons.euro_rounded,
                  isOdd: true,
                  order: 1,
                ),
                const CurrencyCard(
                  name: "Bitcoin",
                  code: "BTC",
                  amount: "23,422,123",
                  icon: Icons.currency_bitcoin_outlined,
                  isOdd: false,
                  order: 2,
                ),
                const CurrencyCard(
                  name: "Euro",
                  code: "EUR",
                  amount: "6,428",
                  icon: Icons.euro_rounded,
                  isOdd: true,
                  order: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
