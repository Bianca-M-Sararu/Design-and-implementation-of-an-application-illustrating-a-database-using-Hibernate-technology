<%@page import="DAOImpl.AlbumeDaoImpl"%>
<%@page import="DAOImpl.MuzicieniDaoImpl"%>
<%@page import="pojo.Albume"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Muzicieni"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga Melodie</title>
        <%@ taglib prefix="mel" uri="http://java.sun.com/jsp/jstl/core" %>
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
            form {
                background-color: #ffffff;
                margin: 20px auto;
                padding: 20px;
                border: 1px solid #dcdcdc;
                border-radius: 8px;
                width: 50%;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            form table {
                width: 100%;
                margin-bottom: 20px;
            }
            form td {
                padding: 8px;
                text-align: left;
            }
            form select, form input[type="text"] {
                width: 100%;
                padding: 8px;
                border: 1px solid #dcdcdc;
                border-radius: 4px;
            }
            form input[type="submit"] {
                background-color: #004080;
                color: #ffffff;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                border-radius: 4px;
                width: 100%;
            }
            form input[type="submit"]:hover {
                background-color: #0066cc;
            }
            a {
                text-decoration: none;
                color: #004080;
                display: block;
                text-align: center;
                margin-top: 20px;
            }
            a:hover {
                text-decoration: underline;
            }
            .button-container {
                text-align: center;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
<%
		MuzicieniDaoImpl muzicianDaoImpl = new MuzicieniDaoImpl();
        AlbumeDaoImpl albumDaoImpl = new AlbumeDaoImpl();
        List<Muzicieni> listaMuzicieni = new ArrayList();
        
        List<Albume> listaAlbume = new ArrayList();
        listaAlbume = albumDaoImpl.afiseazaAlbume();
        listaMuzicieni = muzicianDaoImpl.afiseazaMuzicieni();
        request.setAttribute("listaMuzicieni", listaMuzicieni);
        request.setAttribute("listaAlbume", listaAlbume);
%>
        <div id="add">
            <h1> Adauga o noua melodie </h1>
            <form action="MelodiiController" method="GET">
                <table>
                    <tr>
                        <td> Muzician: </td>
                        <td>
                            <select name="idmuzician">
                                <mel:forEach items="${listaMuzicieni}" var="muzicieni">
                                    <option value="${muzicieni.idmuzician}">${muzicieni.idmuzician}, ${muzicieni.nume}, ${muzicieni.prenume}, ${muzicieni.numescena}, ${muzicieni.aninceputactivitate}, ${muzicieni.varsta}, ${muzicieni.stilmuzical}</option>
                                </mel:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td> Album: </td>
                        <td>
                            <select name="idalbum">
                                <mel:forEach items="${listaAlbume}" var="albume">
                                    <option value="${albume.idalbum}">${albume.idalbum}, ${albume.nume}, ${albume.numarpiese}, ${albume.dataLansare}, ${albume.stilmuzical}</option>
                                </mel:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td> Nume: </td>
                        <td><input type="text" name="nume"></td>
                    </tr>
                    <tr>
                        <td> Durata (minute): </td>
                        <td><input type="text" name="durataMinute"></td>
                    </tr>
                    <tr>
                        <td> Data Lansare: </td>
                        <td><input type="text" name="dataLansare"></td>
                    </tr>
                    
                    <tr>
                        <td> Premiu: </td>
                        <td><input type="text" name="premiu"></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" name="adaugaMelodie" value="Adauga">
                        </td>
                    </tr>
                </table>
            </form>
        </div>

        <div class="button-container">
            <form action="MelodiiController" method="POST">
                <input type="submit" name="afiseazaMelodii" value="Afiseaza">
            </form>
        </div>

        <a href="index.html"><b>Home</b></a>

    </body>
</html>
