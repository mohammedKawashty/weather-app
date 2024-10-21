import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class noWeather extends StatelessWidget {
  const noWeather({super.key});

  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'there is no weather 😔 start',
              style:TextStyle(fontWeight: FontWeight.bold,fontSize: 28),

            ),
            Text(
              'searching now 🔍',
              style:TextStyle(fontWeight: FontWeight.bold,fontSize: 28),
            ),
          ],
        ),
      ),
    );
  }
}
