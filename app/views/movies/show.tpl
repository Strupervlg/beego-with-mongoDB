<html lang="ru">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>{{.Movie.Title}}</title>
</head>
<body>
<h1>Фильм {{.Movie.Title}}</h1>
<form method="post">
    <div>
        <div>
            <label>Наименование</label>
            <span>{{.Movie.Title}}</span>
        </div>
        <div>
            <label>Режисер</label>
            <span>{{.Movie.Director}}</span>
        </div>
        <div>
            <label>Год релиза</label>
            <span>{{.Movie.ReleasedYear}}</span>
        </div>
        <div>
            <label>Рейтинг</label>
            <span>{{.Movie.Rating}}</span>
        </div>
        <label>Жанры</label>
        <div>
            {{range $key, $val := .Movie.Genre}}
            <div>
                {{$val}}
            </div>
            {{end}}
        </div>
    </div>
    <br>
    <br>
    <a href="/">Назад</a>
</form>
</body>
</html>