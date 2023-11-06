<html lang="ru">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>update movie</title>
    <link rel="stylesheet" href="/static/css/main.css">
</head>
<body class="main">
<h1 style="text-align: center">Редактирование фильма {{.Movie.Title}}</h1>
<form style="display: block; margin-left: auto; margin-right: auto; width: 600px" method="post">
    <div style="width: 100%">
        <div style="display: flex; justify-content: space-between;" class="input-group">
            <label class="lbl" for="title">Наименование</label>
            <input class="input" id="title" required type="text" name="title" value="{{.Movie.Title}}">
        </div>
        <div style="display: flex; justify-content: space-between;" class="input-group">
            <label class="lbl" for="director">Режиссер</label>
            <input class="input" id="director" required type="text" name="director" value="{{.Movie.Director}}">
        </div>
        <div style="display: flex; justify-content: space-between;" class="input-group">
            <label class="lbl" for="releasedYear">Год релиза</label>
            <input class="input" id="releasedYear" required type="number" name="releasedYear" value="{{.Movie.ReleasedYear}}">
        </div>
        <div style="display: flex; justify-content: space-between;" class="input-group">
            <label class="lbl" for="rating">Рейтинг</label>
            <input class="input" id="rating" required type="number" min="0" max="10" step="0.1" name="rating" value="{{.Movie.Rating}}">
        </div>
        <label class="lbl">Жанры</label>
        <div id="genres">
            {{range $key, $val := .Movie.Genre}}
            <div>
                <input class="input" type="text" required name="genre[]" value="{{$val}}">
                {{if ne $key 0}}
                <button class="btn" type="button" onclick="delGenre(this)">Удалить</button>
                {{end}}
            </div>
            {{end}}
        </div>
        <button class="btn" type="button" onclick="addGenre()">Добавить</button>
    </div>
    <br>
    <br>
    <button class="btn" type="submit">Обновить</button> <a class="btn" href="/">Назад</a>
</form>
</body>
<script>
    function addGenre() {
        let node = document.createElement("div")
        node.innerHTML = `<input class="input" type="text" required name="genre[]">
            <button class="btn" type="button" onclick="delGenre(this)">Удалить</button>`
        document.getElementById("genres").appendChild(node)
    }
    function delGenre(el) {
        el.parentElement.remove()
    }
</script>
</html>