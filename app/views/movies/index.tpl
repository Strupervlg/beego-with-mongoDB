<html lang="ru">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>movies</title>
    <link rel="stylesheet" href="/static/css/nouislider.min.css">
    <script src="/static/js/nouislider.min.js"></script>
</head>
<body>
<h1>Список фильмов</h1>
<div style="width: 500px">
    <form method="post">
        <div>
<div data-range="input" data-range-min="0" data-current-min="{{.MinRating}}" data-current-max="{{.MaxRating}}" data-range-max="10" data-range-step="0.1"></div>
    <div style="display: flex; justify-content: space-between">
        <input readonly name="min_rating" class="slider-min" type="text" />
        <input readonly name="max_rating" class="slider-max" type="text" />
    </div>
        </div>
        <div>
<div data-range="year" data-range-min="1950" data-current-min="{{.MinYear}}" data-current-max="{{.MaxYear}}" data-range-max="2023" data-range-step="1"></div>
        <div style="display: flex; justify-content: space-between">
            <input readonly name="min_year" class="slider-min" type="text" />
            <input readonly name="max_year" class="slider-max" type="text" />
        </div>
        </div>
        <button type="submit">Показать</button>
</form>
</div>
<ul>
    {{range .Items}}
    <li>{{.title}} {{.rating}} <a href="/{{._id}}/">Изменить</a> <form method="post" style="display: inline-block" action="/delete/{{._id}}/"><button style="display: inline-block" type="submit">Удалить</button></form></li>
    {{end}}
</ul>
<a href="/create/">Создать</a>
<script>
    const ranges = document.querySelectorAll("[data-range]");
    ranges.forEach((range) => {
        const min = parseFloat(range.dataset.rangeMin ?? '');
        const max = parseFloat(range.dataset.rangeMax ?? '');
        const curMin = parseFloat(range.dataset.currentMin ?? '');
        const curMax = parseFloat(range.dataset.currentMax ?? '');
        const step = parseFloat(range.dataset.rangeStep ?? '');
        // @ts-ignore
        const minInput = range.parentElement.querySelector('.slider-min');
        // @ts-ignore
        const maxInput = range.parentElement.querySelector('.slider-max');

        const slider = noUiSlider.create(range, {
            range: {
                min: !isNaN(min) ? min : 0,
                max: !isNaN(max) ? max : 10,
            },
            step: !isNaN(step) ? step : 0.1,
            start: [!isNaN(curMin) ? curMin : (!isNaN(min) ? min : 0), !isNaN(curMax) ? curMax : (!isNaN(max) ? max : 100)],
            connect: true,
            tooltips: false,
        });
        slider.on('update', function(values, handle) {
            if (handle === 0) {
                if(range.dataset.range == "year") {
                    minInput.value = Math.floor(values[handle]);
                } else {
                    minInput.value = values[handle];
                }

            }
            if (handle === 1) {
                if(range.dataset.range == "year") {
                    maxInput.value = Math.floor(values[handle]);
                } else {
                    maxInput.value = values[handle];
                }

            }
        });

        // @ts-ignore
        minInput.addEventListener('change', function() {
            // @ts-ignore
            slider.set([this.value, null]);
        });

        // @ts-ignore
        maxInput.addEventListener('change', function() {
            // @ts-ignore
            slider.set([null, this.value]);
        });
        // @ts-ignore
        range.slider = slider;
    })
</script>
</body>
</html>