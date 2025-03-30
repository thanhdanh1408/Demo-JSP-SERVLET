<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Trang chủ</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
</head>
<style>
    card {
        background-color: rgba(255, 255, 255, 0.9);
        margin-top:2cm;
    }

    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        height: 100vh;
        display: flex;
        flex-direction: column;
        background: url('<%= request.getContextPath() %>/img/tonikroos.jpg') no-repeat center center fixed;
        background-size: cover;
    }

    .container {
        max-width: 800px;
        margin: auto;
        background: rgba(255, 255, 255, 0.8);
        padding: 20px;
        border-radius: 10px;
    }

    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: white;
        padding: 15px;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
    }

    .user-info {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .post-card {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        margin-bottom: 15px;
    }

    .btn-primary {
        background-color: #1877f2;
        color: white;
        border: none;
        border-radius: 4px;
        padding: 8px 16px;
        font-weight: bold;
    }

    .btn-primary:hover {
        background-color: #166fe5;
    }

    .btn-follow {
        background-color: #1877f2;
        color: white;
        border: none;
        padding: 5px 10px;
        border-radius: 4px;
    }

    .btn-follow.following {
        background-color: #e4e6eb;
        color: #050505;
    }

    .pagination {
        display: flex;
        justify-content: center;
        gap: 10px;
        margin-top: 20px;
    }

    .page-link {
        padding: 8px 12px;
        border: 1px solid #ddd;
        border-radius: 4px;
        text-decoration: none;
    }

</style>
<body>

<div class="header">
    <h1>Trang chủ</h1>
    <div class="user-info">
        <a href="${pageContext.request.contextPath}/follows/following" class="btn">Theo dõi</a>
        <span>Xin chào, ${sessionScope.user.username}</span>
        <a href="${pageContext.request.contextPath}/logout" class="btn">Đăng xuất</a>
    </div>
</div>

<div class="container">
    <!-- Nút đăng bài -->
    <button onclick="togglePostForm()" class="btn btn-primary">Đăng bài mới</button>

    <!-- Form đăng bài (mặc định ẩn) -->
    <div id="postForm" class="post-card" style="display: none;">
        <form action="${pageContext.request.contextPath}/post" method="post">
            <input type="text" name="title" placeholder="Tiêu đề bài viết" required class="form-control">
            <textarea name="body" rows="4" placeholder="Nội dung bài viết" required class="form-control"></textarea>
            <button type="submit" class="btn btn-primary">Đăng bài</button>
            <button type="button" onclick="togglePostForm()" class="btn">Hủy</button>
        </form>
    </div>

    <!-- Danh sách bài viết -->
    <div class="post-list">
        <c:forEach items="${posts}" var="post">
            <div class="post-card">
                <h3>${post.title}</h3>
                <p>${post.body}</p>
                <small>Đăng bởi: ${post.user.username}</small>
            </div>
        </c:forEach>
    </div>
</div>

<script>
    function togglePostForm() {
        const form = document.getElementById('postForm');
        form.style.display = (form.style.display === 'none') ? 'block' : 'none';
    }
</script>

</body>
</html>
