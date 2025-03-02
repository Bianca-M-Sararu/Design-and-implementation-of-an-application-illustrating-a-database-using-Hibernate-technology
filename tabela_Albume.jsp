<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Albume</title>
        <%@ taglib prefix="a" uri="http://java.sun.com/jsp/jstl/core" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#stergeAlbum").hide();
                $("#modificaAlbum").hide();

                $("#update").click(function () {
                    $("#modificaAlbum").show();
                    $("#stergeAlbum").hide();
                });
                $("#delete").click(function () {
                    $("#stergeAlbum").show();
                    $("#modificaAlbum").hide();
                });
            });
        </script>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f8ff;
                color: #333;
                margin: 0;
                padding: 0;
            }
            h1 {
                color: #004080;
                text-align: center;
                margin-top: 20px;
            }
            table {
                width: 90%;
                margin: 20px auto;
                border-collapse: collapse;
                background-color: #ffffff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            table th, table td {
                border: 1px solid #dcdcdc;
                padding: 8px;
                text-align: left;
            }
            table th {
                background-color: #004080;
                color: #ffffff;
            }
            table tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            form {
                background-color: #ffffff;
                margin: 20px auto;
                padding: 20px;
                border: 1px solid #dcdcdc;
                border-radius: 8px;
                width: 50%;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            form p {
                text-align: center;
            }
            form input, form select, form button {
                margin: 5px 0;
                padding: 8px;
                width: 100%;
                border: 1px solid #dcdcdc;
                border-radius: 4px;
            }
            form button {
                background-color: #004080;
                color: #ffffff;
                border: none;
                cursor: pointer;
            }
            form button:hover {
                background-color: #0066cc;
            }
            a {
                text-decoration: none;
                color: #004080;
            }
            a:hover {
                text-decoration: underline;
            }
            
            .checkbox-container {
                position: fixed;
                bottom: 20px;
                right: 10px;
                background-color: #ffffff;
                border: 1px solid #dcdcdc;
                padding: 15px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                z-index: 100; /* Ensure it's above other elements */
            }
            .checkbox-container label {
                display: block;
                font-weight: bold;
                color: #004080;
                margin-bottom: 5px;
            }
        </style>
    </head>
    <body>
        <h1>Tabela Albume</h1>

        <table>
            <tr>
                <th>IdAlbum</th>
                <th>Nume</th>
                <th>Numar Piese</th>
                <th>Data Lansarii</th>
                <th>Stil Muzical</th>
            </tr>
            <a:forEach var="albume" items="${listaAlbume}">
                <tr>
                    <td>${albume.idalbum}</td>
                    <td>${albume.nume}</td>
                    <td>${albume.numarpiese}</td>
                    <td>${albume.dataLansare}</td>
                    <td>${albume.stilmuzical}</td>
                </tr>
            </a:forEach>
        </table>

        <div class="checkbox-container">
            <label>Modifica:</label>
            <input type="checkbox" id="update">
            <label>Sterge:</label>
            <input type="checkbox" id="delete" onclick="document.getElementById('nume').disabled = this.checked;
                    document.getElementById('numarpiese').disabled = this.checked;
                    document.getElementById('dataLansare').disabled = this.checked;
                    document.getElementById('stilmuzical').disabled = this.checked;">
        </div>

        <form action="AlbumeController" method="POST">
            <p>Id Album:
                <select name="idalbum">
                    <a:forEach items="${listaAlbume}" var="albume">
                        <option value="${albume.idalbum}">${albume.idalbum}</option>
                    </a:forEach>
                </select>
            </p>

            <p>Modifica Nume: <input id="nume" type="text" name="nume"></p>
            <p>Modifica Numar Piese: <input id="numarpiese" type="text" name="numarpiese"></p>
            <p>Modifica Data Lansarii: <input id="dataLansare" type="text" name="dataLansare"></p>
            <p>Modifica Stil Muzical: <input id="stilmuzical" type="text" name="stilmuzical"></p>

            <button type="submit" id="modificaAlbum" name="modificaAlbum">Modifica</button>
            <button type="submit" id="stergeAlbum" name="stergeAlbum">Sterge</button>
        </form>

        <p align="center">
            <a href="index.html"><b>Home</b></a>
        </p>
    </body>
</html>
