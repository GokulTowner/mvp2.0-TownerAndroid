import 'package:townerapp/core/network/sample_user_model.dart';

import '../../imports.dart';

class UserService {
  final ApiHelper _apiHelper;
  final String _baseUrl = 'https://api.example.com';

  UserService(this._apiHelper);

  // POST: Create a new user
  Future<User> createUser(User user) async {
    try {
      final response = await _apiHelper.postRequest(
        url: '$_baseUrl/users',
        data: user.toJson(),
        isAuthenticated: true,
        token: await _getAuthToken(),
      );

      if (response.statusCode == 201) {
        return User.fromJson(response.data);
      } else {
        throw ApiException(
          httpCode: response.statusCode ?? -1,
          status: 'error',
          message: 'Failed to create user',
        );
      }
    } catch (e) {
      if (e is BaseException) {
        rethrow;
      }
      throw AppException(message: 'An unexpected error occurred');
    }
  }

  // GET: Fetch user details
  Future<User> getUser(String userId) async {
    try {
      final response = await _apiHelper.getRequest(
        url: '$_baseUrl/users/$userId',
        isAuthenticated: true,
        token: await _getAuthToken(),
      );

      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        throw ApiException(
          httpCode: response.statusCode ?? -1,
          status: 'error',
          message: 'Failed to fetch user',
        );
      }
    } catch (e) {
      if (e is BaseException) {
        rethrow;
      }
      throw AppException(message: 'An unexpected error occurred');
    }
  }

  // PUT: Update user details
  Future<User> updateUser(String userId, User updatedUser) async {
    try {
      final response = await _apiHelper.putRequest(
        url: '$_baseUrl/users/$userId',
        data: updatedUser.toJson(),
        isAuthenticated: true,
        token: await _getAuthToken(),
      );

      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        throw ApiException(
          httpCode: response.statusCode ?? -1,
          status: 'error',
          message: 'Failed to update user',
        );
      }
    } catch (e) {
      if (e is BaseException) {
        rethrow;
      }
      throw AppException(message: 'An unexpected error occurred');
    }
  }

  // DELETE: Remove a user
  Future<void> deleteUser(String userId) async {
    try {
      final response = await _apiHelper.deleteRequest(
        url: '$_baseUrl/users/$userId',
        isAuthenticated: true,
        token: await _getAuthToken(),
      );

      if (response.statusCode != 204) {
        throw ApiException(
          httpCode: response.statusCode ?? -1,
          status: 'error',
          message: 'Failed to delete user',
        );
      }
    } catch (e) {
      if (e is BaseException) {
        rethrow;
      }
      throw AppException(message: 'An unexpected error occurred');
    }
  }

  // Helper method to get the authentication token
  Future<String> _getAuthToken() async {
    // Implement your logic to retrieve the authentication token
    // This could be from secure storage, a state management solution, etc.
    return 'your_auth_token_here';
  }
}
