<html lang="ru">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>{{.Movie.Title}}</title>
    <link rel="stylesheet" href="/static/css/main.css">
</head>
<body class="main">
<h1 style="text-align: center">Фильм {{.Movie.Title}}</h1>
<div style="display: block; margin-left: auto; margin-right: auto; width: 500px">
    <div style="width: 100%">
        <div style="display: flex; justify-content: space-between;" class="input-group">
            <label class="lbl">Наименование</label>
            <span class="lbl">{{.Movie.Title}}</span>
        </div>
        <div style="display: flex; justify-content: space-between;" class="input-group">
            <label class="lbl">Режиссер</label>
            <span class="lbl">{{.Movie.Director}}</span>
        </div>
        <div style="display: flex; justify-content: space-between;" class="input-group">
            <label class="lbl">Год релиза</label>
            <span class="lbl">{{.Movie.ReleasedYear}}</span>
        </div>
        <div style="display: flex; justify-content: space-between;" class="input-group">
            <label class="lbl">Рейтинг</label>
            <span class="lbl">{{.Movie.Rating}}</span>
        </div>
        <label class="lbl">Жанры:</label>
        <div>
            {{range $key, $val := .Movie.Genre}}
            <div class="lbl" style="margin-bottom: 5px">
                {{$val}}
            </div>
            {{end}}
        </div>
    </div>
    <br>
    <br>
    <a class="btn" href="/">Назад</a>
</div>
</body>
</html>