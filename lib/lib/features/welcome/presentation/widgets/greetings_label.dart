import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_web/lib/features/welcome/presentation/providers/welcome_page_providers.dart';
import 'package:sample_web/lib/features/welcome/presentation/viewmodels/greetings_viewmodel.dart';

class GreetingsLabel extends ConsumerStatefulWidget {
  const GreetingsLabel({super.key});
  @override
  GreetingsLabelState createState() => GreetingsLabelState();
}

class GreetingsLabelState extends ConsumerState<GreetingsLabel> {

  late GreetingsViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = ref.read(greetingsViewModelProvider.notifier);
    vm.initializeGreetings();
  }

  @override
  void dispose() {
    vm.resetTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var greeting = ref.watch(greetingsViewModelProvider);

    return Text(greeting, style:
    const TextStyle(
        fontSize: 100,
        fontWeight: FontWeight.bold,
        color: Colors.white
    )
    );
  }
}