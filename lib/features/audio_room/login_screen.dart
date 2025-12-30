import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../services/session_manager/session_controller.dart';
import '../../configs/routes/routes_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  String _errorMessage = '';

  final _dio = Dio(BaseOptions(
    baseUrl: 'https://chat-app-1-qvl9.onrender.com',
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  ));

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    // Null-safe form validation
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final uname = (_usernameController.text ?? '').trim();
      final mail = (_emailController.text ?? '').trim();
      final pass = (_passwordController.text ?? '').trim();

      debugPrint('🔄 Attempting login: $uname / $mail');

      final response = await _dio.post(
        '/api/admin/login',
        data: {'username': uname, 'email': mail, 'password': pass},
      );
      print(response.data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data ?? {};

        final token = ((data['token'] ?? data['accessToken'] ?? data['access_token'] ??
            data['data']?['token']) ?? '')
            .toString()
            .trim();

        final userData = (data['user'] ??
            data['admin'] ??
            data['data']?['user'] ??
            data['data']?['admin']) as Map<String, dynamic>?;

        if (token.isNotEmpty) {
          await SessionController().saveToken(token);

          final userId =
          (userData?['_id'] ?? userData?['id'] ?? 'admin-${DateTime.now().millisecondsSinceEpoch}')
              .toString();
          final username =
          (userData?['username'] ?? uname).toString().trim();
          final avatarUrl = (userData?['avatar'] ??
              userData?['avatarUrl'] ??
              'https://api.dicebear.com/7.x/avataaars/png?seed=$uname')
              .toString();

          await SessionController().saveFirstParticipant(
            userId: userId,
            username: username,
            avatarUrl: avatarUrl,
          );

          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Login successful! 🎉'),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
              ),
            );
            await Future.delayed(const Duration(milliseconds: 500));
            if (mounted) Navigator.pushReplacementNamed(context, RoutesName.rooms);
          }
          return;
        } else {
          setState(() => _errorMessage = 'Login failed: No token received');
        }
      }
    } on DioException catch (e) {
      setState(() {
        if (e.response?.statusCode == 401) {
          _errorMessage = e.response?.data['message']?.toString() ?? 'Invalid credentials';
        } else if (e.response?.statusCode == 404) {
          _errorMessage = 'Endpoint not found';
        } else if (e.response?.statusCode == 400) {
          _errorMessage = e.response?.data['message']?.toString() ?? 'Bad request';
        } else if (e.type == DioExceptionType.connectionTimeout) {
          _errorMessage = 'Connection timeout';
        } else {
          _errorMessage =
              e.response?.data['message']?.toString() ?? e.message ?? 'Login failed';
        }
      });
    } catch (e) {
      setState(() => _errorMessage = 'Error: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _skipLogin() async {
    await SessionController().saveToken('demo-mode-token');
    await SessionController().saveFirstParticipant(
      userId: 'demo-${DateTime.now().millisecondsSinceEpoch}',
      username: 'Demo User',
      avatarUrl: 'https://api.dicebear.com/7.x/avataaars/png?seed=demo',
    );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Demo Mode - UI testing only'),
          backgroundColor: Colors.orange,
        ),
      );
      Navigator.pushReplacementNamed(context, RoutesName.rooms);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.purple.shade700, Colors.blue.shade700],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 450),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.purple.shade50,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.admin_panel_settings,
                            size: 60,
                            color: Colors.purple.shade700,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Admin Login',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple.shade700),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Voice Rooms Management',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        const SizedBox(height: 32),
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            hintText: 'Enter username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: const Icon(Icons.person),
                          ),
                          validator: (value) {
                            if ((value ?? '').trim().isEmpty) {
                              return 'Please enter username';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'Enter email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: const Icon(Icons.email),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            final v = (value ?? '').trim();
                            if (v.isEmpty) return 'Please enter email';
                            if (!v.contains('@')) return 'Please enter valid email';
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: const Icon(Icons.lock),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if ((value ?? '').isEmpty) return 'Please enter password';
                            return null;
                          },
                        ),
                        if (_errorMessage.isNotEmpty) ...[
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.red.shade50,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.red.shade300),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.error_outline, color: Colors.red.shade700),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    _errorMessage,
                                    style: TextStyle(
                                        color: Colors.red.shade900, fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _login,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: Colors.purple.shade700,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: _isLoading
                                ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                                : const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Divider(),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            onPressed: _skipLogin,
                            icon: const Icon(Icons.preview),
                            label: const Text('Demo Mode'),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
