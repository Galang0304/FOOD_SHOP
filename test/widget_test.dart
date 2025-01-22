// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:aplikasi_sederhana/main.dart';

void main() {
  testWidgets('Food Shop app test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app title is displayed
    expect(find.text('Food Shop'), findsOneWidget);

    // Verify that we have food items
    expect(find.text('Nasi Goreng Spesial'), findsOneWidget);
    expect(find.text('Mie Goreng'), findsOneWidget);
    expect(find.text('Sate Ayam'), findsOneWidget);
    expect(find.text('Gado-gado'), findsOneWidget);

    // Test the buy button
    await tester.tap(find.widgetWithText(ElevatedButton, 'Beli').first);
    await tester.pumpAndSettle();

    // Verify that the snackbar appears with correct text
    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Nasi Goreng Spesial ditambahkan ke keranjang'), findsOneWidget);
  });
}
