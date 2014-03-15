<%-- 
    Document   : index
    Created on : Mar 9, 2014, 2:59:54 PM
    Author     : putih
--%>

<?xml version = "1.0"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<!-- Fig. 9.12: WelcomeServlet2.html -->

<html xmlns = "http://www.w3.org/1999/xhtml">
    <head>
        <title>Tambah Buku</title>
        <style type="text/css">
            body {font-family:Arial;width: 1000px;margin: 0px auto;}
        </style>
    </head>

    <body>
        <h1>Form Pengisian Buku Baru</h1>
        <form action = "/Amazing/BookViewer" method = "get">

            <style type="text/css">
                .tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
                .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
                .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
                .tg .tg-s6z2{text-align:center}
            </style>
            <table class="tg">
                <tr>
                    <th class="tg-s6z2">Nama Anda</th>
                    <th class="tg-s6z2"><input type = "text" name = "namamu" /><br /></th>
                </tr>
                <tr>
                    <td class="tg-031e">ISBN</td>
                    <td class="tg-031e"><input type = "text" name = "isbn" /><br /></td>
                </tr>
                <tr>
                    <td class="tg-031e">Judul</td>
                    <td class="tg-031e"><input type = "text" name = "title" /><br /></td>
                </tr>
                <tr>
                    <td class="tg-031e">Edisi</td>
                    <td class="tg-031e"><input type = "text" name = "edisi" /><br /></td>
                </tr>
                <tr>
                    <td class="tg-031e">Penerbit</td>
                    <td class="tg-031e"><input type = "text" name = "publisher" /><br /></td>
                </tr>
                <tr>
                    <td class="tg-031e">Harga</td>
                    <td class="tg-031e"><input type = "text" name = "price" /><br /></td>
                </tr>
                <tr>
                    <td class="tg-031e" colspan="2"><input type = "submit" value = "Submit" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
