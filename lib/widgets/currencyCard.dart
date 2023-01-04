import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isOdd;
  final double order;

  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.isOdd,
    required this.order,
  });
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -15 * order),
      child: Container(
        clipBehavior: Clip.hardEdge, //overflow: false;
        decoration: BoxDecoration(
            color: isOdd ? Colors.grey[700] : Colors.white,
            borderRadius: BorderRadius.circular(22)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: isOdd ? Colors.white : Colors.grey[800],
                      fontSize: 32,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      amount,
                      style: TextStyle(
                          color: isOdd ? Colors.white : Colors.grey[800],
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      code,
                      style: TextStyle(
                          color: isOdd
                              ? Colors.white.withOpacity(0.7)
                              : Colors.grey[800],
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
            Transform.scale(
              scale: 3,
              child: Transform.translate(
                offset: const Offset(-8, 5),
                child: Icon(
                  icon,
                  color: isOdd ? Colors.white : Colors.grey[800],
                  size: 50,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
