import 'package:earnipay/app/modules/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

Widget createHomePage() => BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(
        HomeRepository(),
      ),
      child: MaterialApp(
        home: Home(),
      ),
    );
void main() {
  group('Home Page Widget Tests', () {
    testWidgets('Testing if ListView shows up', (tester) async {
      await tester.pumpWidget(createHomePage());
      expect(find.byType(CustomScrollView), findsOneWidget);
    });

    testWidgets('Testing App Bar', (tester) async {
      await tester.pumpWidget(createHomePage());
      expect(find.text('Photos'), findsOneWidget);
    });
    testWidgets('Testing App CustomScrollView', (tester) async {
      await tester.pumpWidget(createHomePage());
      expect(find.byType(CustomScrollView), findsOneWidget);
    });

    testWidgets('Testing Stack inside the CustomScrollView', (tester) async {
      await tester.pumpWidget(createHomePage());
      expect(find.byType(Stack), findsOneWidget);
    });
    testWidgets('Testing Position widgets inside the Stack', (tester) async {
      await tester.pumpWidget(createHomePage());
      expect(find.byType(Positioned), findsOneWidget);
    });
  });
}