import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ErrorDialog extends StatelessWidget {
  String? message;
  ErrorDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))
        ),
        backgroundColor: Colors.orange,
        title: const Icon(Icons.error_outline, size: 30,),
        content: Text(message??'There is error, please try again later.'),
        actions: [
          Center(
            child: TextButton(onPressed: (){
              SystemNavigator.pop();
            }, child: const Text('Exit', style: TextStyle(fontSize: 20, color: Colors.black),),),
          )
        ],
      ),
    );
  }
}