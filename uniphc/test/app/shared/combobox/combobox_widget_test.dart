import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:uniphc/app/shared/combobox/combobox_widget.dart';

main() {
  testWidgets('ComboboxWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(ComboboxWidget(
      items: <Model>[],
      itemSelecionado: null,
      onChanged: (Model) {},
    )));
    final textFinder = find.text('Combobox');
    expect(textFinder, findsOneWidget);
  });
}
