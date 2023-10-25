<html lang="ru">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>movies</title>
</head>
<body>
<h1>Список фильмов</h1>
<ul>
    {{range .Items}}
    <li>{{.title}} <a href="/{{._id}}/">Изменить</a> <form method="post" style="display: inline-block" action="/delete/{{._id}}/"><button style="display: inline-block" type="submit">Удалить</button></form></li>
    {{end}}
</ul>
<a href="/create/">Создать</a>
</body>
</html>