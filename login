<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2.0.0/dist/umd/supabase.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
            margin: 0;
        }
        .login-container {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }
        .login-container h1 {
            margin-bottom: 20px;
        }
        .login-container input, .login-container button {
            margin-bottom: 10px;
            padding: 10px;
            width: 100%;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .login-container button {
            background-color: #007bff;
            color: #fff;
            border: none;
        }
        .login-container button:hover {
            background-color: #0056b3;
        }
        .error, .message {
            margin-top: 10px;
            color: red;
        }
        .message {
            color: green;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Login</h1>
        <form id="loginForm">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <button type="submit">Login</button>
            <p class="error" id="error"></p>
            <p class="message" id="message"></p>
        </form>
    </div>

    <script>
        // Initialize Supabase client
        const supabaseUrl = 'YOUR_SUPABASE_URL';
        const supabaseKey = 'YOUR_SUPABASE_ANON_KEY';
        const supabase = supabase.createClient(supabaseUrl, supabaseKey);

        // Handle form submission
        document.getElementById('loginForm').addEventListener('submit', async (event) => {
            event.preventDefault();

            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;

            // Authenticate the user
            const { data, error } = await supabase.auth.signInWithPassword({
                email,
                password,
            });

            if (error) {
                document.getElementById('error').textContent = `Error: ${error.message}`;
                document.getElementById('message').textContent = '';
            } else {
                document.getElementById('error').textContent = '';
                document.getElementById('message').textContent = 'Login successful!';
                // Redirect or handle successful login
                window.location.href = '/dashboard'; // Change this to your desired page
            }
        });
    </script>
</body>
</html>
