import 'package:flutter/material.dart';
import 'package:responsive_design/demo_text_page.dart';
import 'package:responsive_design/widgets.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'courses_data.dart';
import 'demo_layout_builder_page.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Course> courses = Course.courses;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[800],
        centerTitle: true,
        title: const AppBarTitle(),
        leading: ResponsiveVisibility(
          hiddenWhen: const [Condition.largerThan(name: TABLET)],
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ),
        actions: [
           ResponsiveVisibility(
            visible: false,
            visibleWhen: const [Condition.largerThan(name: TABLET)],
            child: MenuTextButton(text: 'Texts ', onPressed: () {_redirectToDemoTextPage(context);}),
          ),
           ResponsiveVisibility(
            visible: false,
            visibleWhen: const [Condition.largerThan(name: TABLET)],
            child: MenuTextButton(text: 'Layouts', onPressed: () {_redirectToLayoutPage(context);}),
          ),
          IconButton(
            icon: const Icon(Icons.mark_email_unread_rounded),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          const Center(child: PageHeader()),
          const SizedBox(
            height: 30,
          ),
          ResponsiveRowColumn(
            rowMainAxisAlignment: MainAxisAlignment.center,
            rowPadding: const EdgeInsets.all(30),
            columnPadding: const EdgeInsets.all(30),
            layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            children: [
              ResponsiveRowColumnItem(
                  rowFlex: 1, child: CourseTile(course: courses[0])),
              ResponsiveRowColumnItem(
                  rowFlex: 1, child: CourseTile(course: courses[1])),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(child: SubscribeBlock()),
        ],
      ),
    );
  }


  _redirectToDemoTextPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)  => const DemoTextPage()));
  }

  _redirectToLayoutPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)  => const DemoLayoutBuilder()));
  }

}
