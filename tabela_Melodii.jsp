<%@page import="DAOImpl.AlbumeDaoImpl"%>
<%@page import="DAOImpl.MuzicieniDaoImpl"%>
<%@page import="pojo.Albume"%>
<%@page import="pojo.Muzicieni"%>
<%@page import="pojo.Melodii"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Melodii</title>
        <%@ taglib prefix="mel" uri="http://java.sun.com/jsp/jstl/core" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#stergeMelodie").hide();
                $("#modificaMelodie").hide();

                $("#update").click(function () {
                    $("#modificaMelodie").show();
                    $("#stergeMelodie").hide();
                });
                $("#delete").click(function () {
                    $("#stergeMelodie").show();
                    $("#modificaMelodie").hide();
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
                bottom:20px;
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
        <%
            MuzicieniDaoImpl muzicianDaoImpl = new MuzicieniDaoImpl();
            AlbumeDaoImpl albumDaoImpl = new AlbumeDaoImpl();
            List<Muzicieni> listaMuzicieni = muzicianDaoImpl.afiseazaMuzicieni();
            List<Albume> listaAlbume = albumDaoImpl.afiseazaAlbume();
            List<Melodii> listaMelodii = (List<Melodii>) request.getAttribute("listaMelodii");
            
            request.setAttribute("listaAlbume", listaAlbume);
            request.setAttribute("listaMuzicieni", listaMuzicieni);
            request.setAttribute("listaMelodii", listaMelodii);
        %>

        <h1>Tabela Melodii</h1>

        <table>
            <tr>
                <th>Id Melodie</th>
                <th>Id Album</th>
                <th>Nume Album</th>
                <th>Numar Piese</th>
                <th>Data Lansare Album</th>
                <th>Stil Muzical Album</th>
                <th>Id Muzician</th>
                <th>Nume Muzician</th>
                <th>Prenume Muzician</th>
                <th>Nume de scena Muzician</th>
                <th>An Debut Muzician</th>
                <th>Varsta Muzician</th>
                <th>Stil Muzical Muzician</th>
                <th>Melodie Nume</th>
                <th>Durata (minute)</th>
                <th>Data Lansare Melodie</th>
                <th>Premiu</th>
            </tr>

            <mel:forEach var="melodii" items="${listaMelodii}">
                <tr>
                    <td>${melodii.idmelodie}</td>
                    <td>${melodii.albume.idalbum}</td>
                    <td>${melodii.albume.nume}</td>
                    <td>${melodii.albume.numarpiese}</td>
                    <td>${melodii.albume.dataLansare}</td>
                    <td>${melodii.albume.stilmuzical}</td>
                    <td>${melodii.muzicieni.idmuzician}</td>
                    <td>${melodii.muzicieni.nume}</td>
                    <td>${melodii.muzicieni.prenume}</td>
                    <td>${melodii.muzicieni.numescena}</td>
                    <td>${melodii.muzicieni.aninceputactivitate}</td>
                    <td>${melodii.muzicieni.varsta}</td>
                    <td>${melodii.muzicieni.stilmuzical}</td>
                    <td>${melodii.nume}</td>
                    <td>${melodii.durataMinute}</td>
                    <td>${melodii.dataLansare}</td>
                    <td>${melodii.premiu}</td>
                </tr>
            </mel:forEach>
        </table>

        <div class="checkbox-container">
            <label>Modifica:</label>
            <input type="checkbox" id="update">
            <label>Sterge:</label>
            <input type="checkbox" id="delete" onclick="document.getElementById('idalbum').disabled = this.checked;
                    document.getElementById('idmuzician').disabled = this.checked;
                    document.getElementById('durataMinute').disabled = this.checked;
                    document.getElementById('dataLansare').disabled = this.checked;
                    document.getElementById('premiu').disabled = this.checked;">
        </div>

        <form action="MelodiiController" method="POST">
            <p>Id Melodie:
                <select name="idmelodie">
                    <mel:forEach items="${listaMelodii}" var="melodii">
                        <option value="${melodii.idmelodie}">${melodii.idmelodie}</option>
                    </mel:forEach>
                </select>
            </p>

            <p>Id Album:
                <select name="idalbum">
                    <mel:forEach items="${listaAlbume}" var="albume">
                        <option value="${albume.idalbum}">${albume.nume}</option>
                    </mel:forEach>
                </select>
            </p>

            <p>Id Muzician:
                <select name="idmuzician">
                    <mel:forEach items="${listaMuzicieni}" var="muzicieni">
                        <option value="${muzicieni.idmuzician}">${muzicieni.nume} ${muzicieni.prenume}</option>
                    </mel:forEach>
                </select>
            </p>

            <p>Modifica Nume: <input id="nume" type="text" name="nume"></p>
            <p>Modifica Durata Melodie (minute): <input id="durataMinute" type="text" name="durataMinute"></p>
            <p>Modifica Data Lansarii: <input id="dataLansare" type="text" name="dataLansare"></p>
            <p>Modifica Premiu: <input id="premiu" type="text" name="premiu"></p>

            <button type="submit" id="modificaMelodie" name="modificaMelodie">Modifica</button>
            <button type="submit" id="stergeMelodie" name="stergeMelodie">Sterge</button>
        </form>

        <p align="center">
            <a href="index.html"><b>Home</b></a>
        </p>
    </body>
</html>
