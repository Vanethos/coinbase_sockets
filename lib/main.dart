import 'package:flutter/material.dart';

void main() {
  runApp(const CoinbaseProApp());
}

class CoinbaseProApp extends StatelessWidget {
  const CoinbaseProApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(
        0.9,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Watching Coins:",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: const BorderSide(
                              color: Colors.blueAccent,
                              width: 2.0,
                            ),
                          ),
                          child: Column(
                            children: [],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                flex: 4,
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CoinButton(
                          isSocketOpen: false,
                          title: "ETH",
                          backgroundColor: Colors.blue,
                          onTap: (isSocketOpen) {},
                        ),
                      ),
                      const SizedBox(
                        width: 24.0,
                      ),
                      Expanded(
                        child: CoinButton(
                          isSocketOpen: false,
                          title: "BTC",
                          backgroundColor: Colors.yellow,
                          onTap: (isSocketOpen) {},
                        ),
                      ),
                    ],
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

class CoinButton extends StatelessWidget {
  final bool isSocketOpen;
  final String title;
  final Function(bool) onTap;
  final Color backgroundColor;

  const CoinButton({
    required this.isSocketOpen,
    required this.title,
    required this.onTap,
    required this.backgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onTap(isSocketOpen),
      color: backgroundColor,
      child: Row(
        children: [
          if (isSocketOpen)
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          if (!isSocketOpen)
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          Text(title),
        ],
      ),
    );
  }
}
