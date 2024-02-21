import 'package:flutter/material.dart';
import 'package:nyacak22_app/ss_cart.dart';
import 'package:nyacak22_app/ss_money.dart';
import 'package:provider/provider.dart';

class SharedState1 extends StatefulWidget {
  const SharedState1({super.key});

  @override
  State<SharedState1> createState() => _Aplikasi1State();
}

class _Aplikasi1State extends State<SharedState1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<Money>(create: (context) => Money()),
          ChangeNotifierProvider<Cart>(create: (context) => Cart())
        ],
        child: Scaffold(
          floatingActionButton: Consumer<Money>(
            builder: (context, money, _) => Consumer<Cart>(
              builder: (context, cart, _) => FloatingActionButton(
                onPressed: () {
                  if (money.balance >= 500) {
                    cart.quantity += 1;
                    money.balance -= 500;
                  }
                },
                backgroundColor: Colors.cyan,
                child: const Icon(Icons.add_shopping_cart),
              ),
            ),
          ),
          appBar: AppBar(
            title: const Text("Multi Provider State Management"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Balance"),
                    Container(
                      height: 30,
                      width: 150,
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 2, color: Colors.cyan)),
                      alignment: Alignment.centerRight,
                      child: Consumer<Money>(
                        builder: (context, money, _) => Text(
                          money.balance.toString(),
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 2, color: Colors.black)),
                  alignment: Alignment.centerRight,
                  child: Consumer<Cart>(
                    builder: (context, cart, _) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Apple (500) x ' + cart.quantity.toString(),
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            (500 * cart.quantity).toString(),
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
