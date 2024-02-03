import 'package:finance_app/Screens/Add.dart';
import 'package:finance_app/Screens/Home%20Screen.dart';
import 'package:finance_app/Screens/Statistics.dart';
import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int index_color = 0;
  List Screen = [const Home(), const Statistics(), const Home(), const Statistics()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[index_color],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (Context)=>const Add_Screen()));
        },
        backgroundColor: const Color(0xff368983),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(padding: const EdgeInsets.only(top: 7.5,bottom: 7.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    index_color=0;
                  });
                },
                child: Icon(
                  Icons.home,
                  size: 30,
                  color: index_color == 0 ? const Color(0xff368983) : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 1;
                  });
                },
                child: Icon(
                  Icons.bar_chart_outlined,
                  size: 30,
                  color: index_color == 1 ? const Color(0xff368983) : Colors.grey,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 2;
                  });
                },
                child: Icon(
                  Icons.account_balance_wallet_outlined,
                  size: 30,
                  color: index_color == 2 ? const Color(0xff368983) : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 3;
                  });
                },
                child: Icon(
                  Icons.person_outlined,
                  size: 30,
                  color: index_color == 3 ? const Color(0xff368983) : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
