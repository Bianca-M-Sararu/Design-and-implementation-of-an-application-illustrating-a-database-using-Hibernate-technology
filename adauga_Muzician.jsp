<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga Muzician</title>
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
            form input[type="text"] {
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

        <div id="add">
            <h1> Adauga Muzician </h1>
            <form action="MuzicieniController" method="GET">
                <table>
                    <tr>
                        <td> Nume Muzician: </td>
                        <td><input type="text" name="nume"></td>
                    </tr>
                    <tr>
                        <td> Prenume Muzician: </td>
                        <td><input type="text" name="prenume"></td>
                    </tr>
                    <tr>
                        <td> Nume Scena Muzician: </td>
                        <td><input type="text" name="numescena"></td>
                    </tr>
                    <tr>
                        <td> An debut Muzician: </td>
                        <td><input type="text" name="aninceputactivitate"></td>
                    </tr>
                    <tr>
                        <td> Varsta Muzician: </td>
                        <td><input type="text" name="varsta"></td>
                    </tr>
                    <tr>
                        <td> Stil Muzical Muzician: </td>
                        <td><input type="text" name="stilmuzical"></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" name="adaugaMuzician" value="Adauga">
                        </td>
                    </tr>
                </table>
            </form>
        </div>

        <div class="button-container">
            <form action="MuzicieniController" method="POST">
                <input type="submit" name="afiseazaMuzicieni" value="Afiseaza">
            </form>
        </div>

        <a href="index.html"><b>Home</b></a>

    </body>
</html>
