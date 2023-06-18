import 'dart:math';

class Book {
  String title;
  String author;
  List<String> genres;

  Book(this.title, this.author, this.genres);
}

class User {
  String name;
  List<Book> ratedBooks;

  User(this.name, this.ratedBooks);
}

class RecommendationSystem {
  List<Book> books;
  List<User> users;

  RecommendationSystem(this.books, this.users);

  List<Book> recommendBooks(User user, int numRecommendations) {
    List<Book> recommendations = [];

    // Calculate similarity scores between the user and other users
    Map<User, double> similarityScores = {};
    for (var otherUser in users) {
      if (otherUser != user) {
        double similarity = calculateSimilarity(user, otherUser);
        similarityScores[otherUser] = similarity;
      }
    }

    // Sort users by similarity score in descending order
    var sortedUsers = similarityScores.keys.toList()
      ..sort((a, b) => similarityScores[b]!.compareTo(similarityScores[a]!));

    // Generate recommendations based on top similar users
    for (var otherUser in sortedUsers) {
      if (recommendations.length >= numRecommendations) {
        break;
      }

      for (var book in otherUser.ratedBooks) {
        if (!user.ratedBooks.contains(book)) {
          recommendations.add(book);
        }

        if (recommendations.length >= numRecommendations) {
          break;
        }
      }
    }

    return recommendations;
  }

  double calculateSimilarity(User user1, User user2) {
    List<String> user1Genres = extractGenres(user1);
    List<String> user2Genres = extractGenres(user2);

    // Jaccard similarity coefficient
    var intersection = user1Genres.toSet().intersection(user2Genres.toSet());
    var union = user1Genres.toSet().union(user2Genres.toSet());
    double similarity = intersection.length / union.length;

    return similarity;
  }

  List<String> extractGenres(User user) {
    List<String> genres = [];
    for (var book in user.ratedBooks) {
      genres.addAll(book.genres);
    }
    return genres;
  }
}

void main() {
  // Sample data
  var book1 = Book("Book 1", "Author 1", ["Genre 1", "Genre 2"]);
  var book2 = Book("Book 2", "Author 2", ["Genre 2", "Genre 3"]);
  var book3 = Book("Book 3", "Author 3", ["Genre 3", "Genre 4"]);

  var user1 = User("User 1", [book1, book2]);
  var user2 = User("User 2", [book2, book3]);

  var books = [book1, book2, book3];
  var users = [user1, user2];

  var recommendationSystem = RecommendationSystem(books, users);
  var user = user1;
  var numRecommendations = 2;

  var recommendations = recommendationSystem.recommendBooks(user, numRecommendations);

  print("Recommendations for ${user.name}:");
  for (var book in recommendations) {
    print(" - ${book.title} by ${book.author}");
  }
}