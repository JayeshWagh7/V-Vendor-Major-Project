document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('b').addEventListener('click', function() {
        window.location.href = 'buy.html';
    });

    document.getElementById('s').addEventListener('click', function() {
        window.location.href = 'sell.html';
    });

    function showsidebar() {
        const sidebar = document.querySelector('.sidebar');
        sidebar.style.display = 'flex';
    }

    function hidesidebar() {
        const sidebar = document.querySelector('.sidebar');
        sidebar.style.display = 'none';
    }

    document.getElementById('h').addEventListener('click', function() { 
        window.location.href = 'index.html';
    });

    document.getElementById('l').addEventListener('click', function() {
        window.location.href = 'Login.html';
    });

    document.getElementById('lo').addEventListener('click', function() {
        window.location.href = 'Login.html';
    });

    document.getElementById('r').addEventListener('click', function() {
        window.location.href = 'SignUp.html';
    });

    document.getElementById('a').addEventListener('click', function() {
        window.location.href = 'about.html';
    });

    document.getElementById('help').addEventListener('click', function() {
        window.location.href = 'Help.html';
    });

    document.getElementById('update').addEventListener('click', function() {
        window.location.href = 'ShowAll.jsp';
    });
});
