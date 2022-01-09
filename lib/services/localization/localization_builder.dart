import 'package:flutter/material.dart';

import 'local_storage.dart';
import 'localization_repo.dart';

class LocaleBuilder extends StatelessWidget {
  final Widget Function(BuildContext, Locale?) builder;

  const LocaleBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: LocaleRepository.instance.observeLocale(),
      builder: (context, snapshot) {
        return SizedBox(
          key: Key(snapshot.data.toString()),
          child: builder(context, Locale(snapshot.data ?? LocalStorage.defaultLocale)),
        );
      },
    );
  }
}
