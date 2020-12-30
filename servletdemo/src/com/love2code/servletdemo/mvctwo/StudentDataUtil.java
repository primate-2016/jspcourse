package com.love2code.servletdemo.mvctwo;

import java.util.ArrayList;
import java.util.List;

public class StudentDataUtil {
	
	// create a list of objects of class Student (the student.java class)
	// calling getStudents() will return this list
	// we're using this as our model instead of a database
	public static List<Student> getStudents() {
		
		// create an empty list
		List<Student> students = new ArrayList<>();
		
		// add sample data
		students.add(new Student("Mary", "Bay", "mary@email.com"));
		students.add(new Student("Jon", "Doe", "john@email.com"));
		students.add(new Student("Andy", "Turf", "andy@email.com"));
		
		//return the list
		return students;
	}

}
