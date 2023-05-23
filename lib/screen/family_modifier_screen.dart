import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/layout/default_layout.dart';
import 'package:untitled/riverpod/family_modifier_provider.dart';

class FamilyModifierScreen extends ConsumerWidget {
  const FamilyModifierScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 일반적으로 사용하듯이 사용했는데 에러가 난다 ?
    // 데이터에 해당하는 파라미터를 넣어줘야 함
    final state = ref.watch(familyModifierProvider(5));
    return DefaultLayout(
        title: "FamilyModifierScreen",
        body: Center(
          child: state.when(
            data: (data) => Text(data.toString()),
            error: (err, stack) => Text(err.toString()),
            loading: () => CircularProgressIndicator(),
          ),
        ));
  }
}
