<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register - SimpleBlog</title>
        <!-- Google Fonts: Inter -->
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap"
            rel="stylesheet">
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- FontAwesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <style>
            :root {
                --primary-color: #4f46e5;
                --secondary-color: #6366f1;
                --bg-color: #f8fafc;
            }

            body {
                font-family: 'Inter', sans-serif;
                background-color: var(--bg-color);
                display: flex;
                align-items: center;
                justify-content: center;
                min-height: 100vh;
                margin: 0;
                padding: 1rem;
            }

            .register-card {
                background: rgba(255, 255, 255, 0.85);
                backdrop-filter: blur(12px);
                border: 1px solid rgba(255, 255, 255, 0.6);
                border-radius: 20px;
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.08);
                padding: 3rem;
                width: 100%;
                max-width: 450px;
                transition: transform 0.3s ease;
            }

            .register-card:hover {
                transform: translateY(-5px);
            }

            .btn-primary {
                background-color: var(--primary-color);
                border-color: var(--primary-color);
                border-radius: 10px;
                transition: all 0.3s ease;
                font-weight: 500;
            }

            .btn-primary:hover {
                background-color: var(--secondary-color);
                border-color: var(--secondary-color);
                transform: translateY(-2px);
                box-shadow: 0 6px 15px rgba(99, 102, 241, 0.4);
            }

            .form-control {
                border-radius: 10px;
                padding: 0.6rem 1rem;
                background-color: #f8fafc;
                border: 1px solid #e2e8f0;
            }

            .form-control:focus {
                border-color: var(--primary-color);
                box-shadow: 0 0 0 0.25rem rgba(79, 70, 229, 0.15);
                background-color: #ffffff;
            }

            .input-group-text {
                border-radius: 10px;
                background-color: #f8fafc;
                border: 1px solid #e2e8f0;
            }

            .brand-logo {
                color: var(--primary-color);
                font-weight: 800;
                font-size: 2rem;
                text-align: center;
                margin-bottom: 1.5rem;
                letter-spacing: -0.5px;
            }
        </style>
    </head>

    <body>

        <div class="register-card">
            <div class="brand-logo">
                <i class="fa-solid fa-pen-nib me-2"></i>SimpleBlog
            </div>
            <h4 class="text-center mb-4 fw-bold text-dark">Create an Account</h4>

            <form action="CustomerController" method="post">
				<input type="hidden" name="action" value="register">
                <div class="mb-3">
                    <label for="name" class="form-label text-muted fw-medium small">Full Name</label>
                    <div class="input-group">
                        <span class="input-group-text border-end-0"><i class="fa-regular fa-user text-muted"></i></span>
                        <input type="text" class="form-control border-start-0 ps-0" id="name" name="name"
                            placeholder="John Doe" required>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label text-muted fw-medium small">Email Address</label>
                    <div class="input-group">
                        <span class="input-group-text border-end-0"><i
                                class="fa-regular fa-envelope text-muted"></i></span>
                        <input type="email" class="form-control border-start-0 ps-0" id="email" name="email"
                            placeholder="name@example.com" required>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label text-muted fw-medium small">Password</label>
                    <div class="input-group">
                        <span class="input-group-text border-end-0"><i class="fa-solid fa-lock text-muted"></i></span>
                        <input type="password" class="form-control border-start-0 ps-0" id="password" name="password"
                            placeholder="••••••••" required>
                    </div>
                </div>
                <div class="mb-4">
                    <label for="confirmPassword" class="form-label text-muted fw-medium small">Confirm Password</label>
                    <div class="input-group">
                        <span class="input-group-text border-end-0"><i class="fa-solid fa-lock text-muted"></i></span>
                        <input type="password" class="form-control border-start-0 ps-0" id="confirmPassword"
                            name="confirmPassword" placeholder="••••••••" required>
                    </div>
                </div>
                <div class="d-grid mb-3">
                    <button type="submit" class="btn btn-primary py-2 fs-6">Register Now</button>
                </div>
                <div class="text-center mt-3">
                    <span class="text-muted small">Already have an account?</span>
                    <a href="login.jsp" class="text-decoration-none fw-semibold small"
                        style="color: var(--primary-color);">Login here</a>
                </div>
            </form>
        </div>

    </body>

    </html>