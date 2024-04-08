import 'package:flutter/material.dart';


class Course {
 String code;
 String title;
 String description;
 Course({required this.code, 
         required this.title,  
         this.description = ""});
}
class CoursesListScreen extends StatelessWidget {
 const CoursesListScreen({required this.courses, required this.onTapped});
 final List<Course> courses;
 final ValueChanged<Course> onTapped;

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: const Text("Courses List")),
     body: ListView(
       children: [
         for (var course in courses)
           ListTile(
             title: Text(course.title),
             subtitle: Text(course.code),
             onTap: () => onTapped(course),
           ),
       ],
     ),);}
}
class CourseDetailsScreen extends StatelessWidget {
 final Course course;
 const CourseDetailsScreen({required this.course});
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text(course.title)),
     body: Center(
       child: Column(
         children: [
           Text(course.title),
           Text(course.code),
           Text(course.description),
         ],
       ),),);
 }
}

class CourseApp extends StatefulWidget {
 @override
 State<CourseApp> createState() => _CourseAppState();
}
class _CourseAppState extends State<CourseApp> {
 Course? _selectedCourse;
  void _tabHandler(Course course) {
   setState(() {
    _selectedCourse = course;
   });
 }


 List<Course> courses = [
   Course(
       code: "SiTE-001",
       title: "Introduction To Programming",
       description: "Computer Organization, Architecture, Programming"),
   Course(
      code: "SiTE-002",
      title: "Mobile Development",
      description: "Development, Programming",
    ),
    Course(
      code: "SiTE-003",
      title: "Introduction To Operating system",
      description: "Computer Organization",
    ),];
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     home: Navigator(
      onPopPage: (route, result) {
         if (!route.didPop(result)) {
           return false;
         }
         setState(() {
           _selectedCourse = null;
         });
         return true;
       },

       pages: [
         MaterialPage(
             key: const ValueKey('CourseListScreen'),
             child: CoursesListScreen(
                courses: courses,
                onTapped: _tabHandler,
         ),
         )
         ,
         if (_selectedCourse != null)
           MaterialPage(
               key: ValueKey(_selectedCourse),
               child: CourseDetailsScreen(course: _selectedCourse!,))
       ],
     ),
   );
 }

}

void main(){
  runApp(CourseApp());
}