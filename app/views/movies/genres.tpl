<html lang="ru">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <link rel="stylesheet" href="/static/css/main.css">
    <title>movies</title>
</head>
<body class="main">
<h1 style="text-align: center"><a href="/">Список фильмов</a></h1>
{{range .Items}}
<h2 class="movies" style="cursor: pointer; text-align: center; font-weight: 900; font-size: 28px" data-id="{{._id}}">{{._id}} ({{.count}})</h2>
<ul id="{{._id}}" style="display: none; list-style: none; padding-left: 0; text-align: center; font-size: 20px">
{{range .movies}}
<li style="margin-bottom: 10px">{{.}}</li>
{{end}}
</ul>
{{end}}
<script>
    const lists = document.querySelectorAll(".movies");
    for (let item of lists) {
        item.addEventListener("click", function() {
            if(document.getElementById(this.dataset.id).style.display == "block") {
                document.getElementById(this.dataset.id).style.display = "none";
            } else {
                document.getElementById(this.dataset.id).style.display = "block";
            }
        });
    }
</script>
</body>
</html>