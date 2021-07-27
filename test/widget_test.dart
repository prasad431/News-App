import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/bloc/news/news_bloc.dart';

import 'package:news_app/main.dart';
import 'package:news_app/ui/presenters/custom_widgets/article_row.dart';
import 'package:news_app/ui/presenters/news_web_view.dart';
import 'mock_news_service.dart';

void main() {
  group('News App', () {
    group('Home Screen', () {
      testWidgets('contains article information', (WidgetTester tester) async {
        await _appendTesterPump(tester);
        _expectTextWidgets([
          'How Jeff Bezos’s Space Watch Became a Marketing Win For Omega',
          'The Blue Origin and Amazon founder.',
        ]);
      });

      testWidgets('contains widgets ArticleRow, GestureDetector',
          (WidgetTester tester) async {
        await _appendTesterPump(tester);
        _expectWidgetTypes(
            tester.allWidgets.toList(), [ArticleRow, GestureDetector]);
      });
    });

    group('NewsWebView Screen', () {
      testWidgets('finds gesture detector', (WidgetTester tester) async {
        final GestureDetector gestureDetector = await _getGesture(tester);
        expect(gestureDetector.runtimeType, GestureDetector);
      });

      testWidgets('navigate to news web view', (WidgetTester tester) async {
        final GestureDetector gestureDetector = await _getGesture(tester);
        gestureDetector.onTap();
        await tester.pumpAndSettle();
        _expectWidgetTypes(tester.allWidgets.toList(), [NewsWebView]);
      });
    });
  });
}

/* 
Private functions that supports NewsApp UI tests
*/

Future<GestureDetector> _getGesture(WidgetTester tester) async {
  await _appendTesterPump(tester);
  final GestureDetector gestureDetector = tester.allWidgets
      .firstWhere((Widget widget) => widget is GestureDetector);
  return gestureDetector;
}

Future<void> _appendTesterPump(WidgetTester tester) async {
  await tester.pumpWidget(MyApp(
    newsBloc: NewsBloc(newsService: MockNewsService()),
  ));
  await tester.pumpAndSettle();
}

void _expectTextWidgets(List<String> expected) {
  for (String text in expected) {
    expect(find.text(text), findsOneWidget);
  }
}

void _expectWidgetTypes(Iterable<Widget> widgets, List<Type> expected) {
  final List<Type> actual = widgets.map((Widget w) => w.runtimeType).toList();
  for (Type type in expected) {
    expect(actual.contains(type), true);
  }
}
