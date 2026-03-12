# Ai-assignment
# Library System – Prolog Assignment

## Overview

This assignment implements several queries for a university library system using Prolog.
The program works with the provided file `library_data.pl`, which contains facts about students, books, borrowed books, topics, and ratings.

The goal is to write predicates that analyze this data and answer specific questions about the library.

---

## Data Facts

The system uses the following facts:

```prolog
student(Name, Year).
book(Title, Author).
borrowed(Student, Book).
topics(Book, TopicsList).
rating(Student, Book, Score).
```
## Implemented Tasks

### Task 1 – Books Borrowed by a Student

Returns a list of books borrowed by a student.

### Task 2 – Borrowers Count

Counts how many students borrowed a specific book.

### Task 3 – Most Borrowed Book

Finds the book that was borrowed the most.

### Task 4 – Ratings of a Book

Returns all ratings of a book as a list of tuples.

### Task 5 – Top Reviewer

Finds the student who gave the highest rating.


### Task 6 – Most Common Topic for a Student

Finds the most frequent topic among books borrowed by a student.
