<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard - SimpleBlog</title>
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
                --text-color: #1e293b;
            }

            body {
                font-family: 'Inter', sans-serif;
                background-color: var(--bg-color);
                color: var(--text-color);
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }

            main {
                flex: 1;
            }

            .blog-card {
                background: #ffffff;
                border: none;
                border-radius: 16px;
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
                transition: all 0.3s ease;
                height: 100%;
                display: flex;
                flex-direction: column;
                overflow: hidden;
            }

            .blog-card:hover {
                transform: translateY(-8px);
                box-shadow: 0 15px 30px -5px rgba(0, 0, 0, 0.1);
            }

            .blog-card-body {
                padding: 1.5rem;
                flex-grow: 1;
                display: flex;
                flex-direction: column;
            }

            .blog-card-title {
                font-size: 1.25rem;
                font-weight: 700;
                color: #0f172a;
                margin-bottom: 0.75rem;
                text-decoration: none;
                transition: color 0.2s;
            }

            .blog-card-title:hover {
                color: var(--primary-color);
            }

            .blog-card-text {
                color: #64748b;
                font-size: 0.95rem;
                line-height: 1.6;
                margin-bottom: 1.25rem;
                flex-grow: 1;
            }

            .tag-badge {
                background-color: rgba(79, 70, 229, 0.1);
                color: var(--primary-color);
                font-weight: 600;
                font-size: 0.75rem;
                padding: 0.4em 0.8em;
                border-radius: 50rem;
                text-decoration: none;
                transition: all 0.2s ease;
                display: inline-block;
                margin-bottom: 1rem;
            }

            .tag-badge:hover {
                background-color: var(--primary-color);
                color: white;
            }

            .blog-meta {
                display: flex;
                align-items: center;
                justify-content: space-between;
                border-top: 1px solid #f1f5f9;
                padding-top: 1rem;
                margin-top: auto;
            }

            .author-info {
                display: flex;
                align-items: center;
                gap: 0.5rem;
                color: #475569;
                font-size: 0.85rem;
                font-weight: 500;
            }

            .author-avatar {
                width: 32px;
                height: 32px;
                border-radius: 50%;
                background-color: #e2e8f0;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #64748b;
                font-weight: bold;
                font-size: 0.8rem;
            }

            .read-more-btn {
                color: var(--primary-color);
                font-weight: 600;
                font-size: 0.9rem;
                text-decoration: none;
                display: flex;
                align-items: center;
                gap: 0.25rem;
                transition: gap 0.2s;
            }

            .read-more-btn:hover {
                gap: 0.5rem;
            }

            .sidebar-widget {
                background: #ffffff;
                border-radius: 16px;
                padding: 1.5rem;
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
                margin-bottom: 1.5rem;
            }

            .widget-title {
                font-size: 1.1rem;
                font-weight: 700;
                color: #0f172a;
                margin-bottom: 1.25rem;
                position: relative;
                padding-bottom: 0.5rem;
            }

            .widget-title::after {
                content: '';
                position: absolute;
                left: 0;
                bottom: 0;
                width: 40px;
                height: 3px;
                background-color: var(--primary-color);
                border-radius: 3px;
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

            .btn-primary {
                background-color: var(--primary-color);
                border-color: var(--primary-color);
                border-radius: 10px;
            }

            .btn-primary:hover {
                background-color: var(--secondary-color);
                border-color: var(--secondary-color);
            }

            .recent-post-item {
                display: flex;
                gap: 1rem;
                margin-bottom: 1rem;
                padding-bottom: 1rem;
                border-bottom: 1px solid #f1f5f9;
            }

            .recent-post-item:last-child {
                margin-bottom: 0;
                padding-bottom: 0;
                border-bottom: none;
            }

            .recent-title {
                font-size: 0.95rem;
                font-weight: 600;
                color: #1e293b;
                text-decoration: none;
                display: block;
                margin-bottom: 0.25rem;
                transition: color 0.2s;
            }

            .recent-title:hover {
                color: var(--primary-color);
            }

            .recent-date {
                font-size: 0.75rem;
                color: #94a3b8;
            }

            .tag-cloud a {
                display: inline-block;
                background: #f1f5f9;
                color: #475569;
                padding: 0.4rem 0.8rem;
                border-radius: 8px;
                font-size: 0.8rem;
                font-weight: 500;
                text-decoration: none;
                margin: 0 0.3rem 0.5rem 0;
                transition: all 0.2s;
            }

            .tag-cloud a:hover {
                background: var(--primary-color);
                color: white;
            }
        </style>
    </head>

    <body>

        <%@ include file="navbar.jsp" %>

            <%@ include file="container.jsp" %>

        <%@ include file="footer.jsp" %>

    </body>

    </html>