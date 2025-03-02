<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Muzicieni</title>
        <%@ taglib prefix="mel" uri="http://java.sun.com/jsp/jstl/core" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#stergeMuzician").hide(); //ascunde butonul
                $("#modificaMuzician").hide();

                $("#update").click(function () {
                    $("#modificaMuzician").show();
                    $("#stergeMuzician").hide();
                });
                $("#delete").click(function () {
                    $("#stergeMuzician").show();
                    $("#modificaMuzician").hide();
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
                z-index: 100;
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
        <h1>Tabela Muzicieni</h1>

        <table>
            <tr>
                <th>Id Muzician</th>
                <th>Nume</th>
                <th>Prenume</th>
                <th>Nume de scena</th>
                <th>An debut</th>
                <th>Varsta</th>
                <th>Stil muzical</th>
            </tr>

            <mel:forEach var="muzicieni" items="${listaMuzicieni}">
                <tr>
                    <td>${muzicieni.idmuzician}</td>
                    <td>${muzicieni.nume}</td>
                    <td>${muzicieni.prenume}</td>
                    <td>${muzicieni.numescena}</td>
                    <td>${muzicieni.aninceputactivitate}</td>
                    <td>${muzicieni.varsta}</td>
                    <td>${muzicieni.stilmuzical}</td>
                </tr>
            </mel:forEach>
        </table>

        <div class="checkbox-container">
            <label>Modifica:</label>
            <input type="checkbox" id="update">
            <label>Sterge:</label>
            <input type="checkbox" id="delete" onclick="document.getElementById('nume').disabled = this.checked;
                    document.getElementById('prenume').disabled = this.checked;
                    document.getElementById('numescena').disabled = this.checked;
                    document.getElementById('aninceputactivitate').disabled = this.checked;
                    document.getElementById('varsta').disabled = this.checked;
                    document.getElementById('stilmuzical').disabled = this.checked;">
        </div>

        <form action="MuzicieniController" method="POST">
            <p>Id Muzician:
                <select name="idmuzician">
                    <mel:forEach items="${listaMuzicieni}" var="muzicieni">
                        <option value="${muzicieni.idmuzician}">${muzicieni.idmuzician}</option>
                    </mel:forEach>
                </select>
            </p>

            <p>Modifica Nume: <input id="nume" type="text" name="nume"></p>
            <p>Modifica Prenume: <input id="prenume" type="text" name="prenume"></p>
            <p>Modifica Nume de scena: <input id="numescena" type="text" name="numescena"></p>
            <p>Modifica Anul de debut: <input id="aninceputactivitate" type="text" name="aninceputactivitate"></p>
            <p>Modifica Varsta: <input id="varsta" type="text" name="varsta"></p>
            <p>Modifica Stilul muzical: <input id="stilmuzical" type="text" name="stilmuzical"></p>

            <button type="submit" id="modificaMuzician" name="modificaMuzician">Modifica</button>
            <button type="submit" id="stergeMuzician" name="stergeMuzician">Sterge</button>
        </form>

        <p align="center">
            <a href="index.html"><b>Home</b></a>
        </p>
    </body>
</html>
