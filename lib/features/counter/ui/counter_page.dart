import 'package:flutter/material.dart';
import 'package:blocpractice/features/counter/bloc/bloc_bloc.dart';
// import '../bloc/bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  BlocBloc counterBloc=BlocBloc();
  @override
void initState() {
  super.initState();
  counterBloc.add(CounterIncrementEvent());
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("counter page")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           counterBloc.add(CounterIncrementEvent());
        },
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<BlocBloc, BlocState>(
        bloc: counterBloc,
        builder: (context, state) {
          switch(state.runtimeType){

            case CounterIncrementState :
            final sucessState=state as CounterIncrementState;
            return Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(sucessState.val.toString(), style: TextStyle(fontSize: 60))],
              ),
            ),
          );
          // break;
          default:return Center(
              child: Text('something went wrong', style: TextStyle(fontSize: 60),
            ),
          );
            
          }
         
        },
      ),
    );
  }
}
