import 'package:Cake_Clicker/bloc/loading_bloc/loading_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/money_bloc/money_bloc.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key, required this.isInited}) : super(key: key);
  final bool isInited;
  @override
  Widget build(BuildContext context) {
    final LoadingBloc loadingBloc = BlocProvider.of<LoadingBloc>(context);
      loadingBloc.add(LoadingUserData());
      
    return SizedBox(
      child: Center(
        child: Column(
          children: [
            const Text(
              'loading...'
            ),
            if(isInited)const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
