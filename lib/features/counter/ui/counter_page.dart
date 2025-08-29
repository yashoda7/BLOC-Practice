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
  int val=0;
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
      body:BlocConsumer<BlocBloc,BlocState>(
        bloc: counterBloc,
        listenWhen: (previous, current) => current is CounterSnackbarActionState,
        buildWhen: (previous, current) => current is! CounterSnackbarActionState,
        listener: (context, state) {
          if(state is CounterSnackbarActionState ){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("snackbar")));
          }
          // else if(state is CounterIncrementActionState){
          //   setState(() {
          //     val=val+1;
          //   });
          // }
        },
        builder: (context, state) { 
        switch(state.runtimeType){

            case CounterIncrementState :
            final sucessState=state as CounterIncrementState;
            return Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(sucessState.val.toString(), style: TextStyle(fontSize: 60)),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  counterBloc.add(CounterSnackbarActionEvent());
                }, child: Text("Scaffold")),
                ],
              ),
            ),
          );
          // break;
          default:return Center(
              child: Text('something went wrong', style: TextStyle(fontSize: 60),
            ),
          );
        }
        }
      ),

    
    );
  }
}
//       body: BlocBuilder<BlocBloc, BlocState>(
//         bloc: counterBloc,
//         builder: (context, state) {
          // switch(state.runtimeType){

          //   case CounterIncrementState :
          //   final sucessState=state as CounterIncrementState;
          //   return Center(
          //   child: Container(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [Text(sucessState.val.toString(), style: TextStyle(fontSize: 60))],
          //     ),
          //   ),
          // );
          // // break;
          // default:return Center(
          //     child: Text('something went wrong', style: TextStyle(fontSize: 60),
          //   ),
          // );
            
//           }
         
//         },
//       ),
//     );
//   }
// }
