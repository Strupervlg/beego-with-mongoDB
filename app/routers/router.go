package routers

import (
	"app/controllers"
	"app/models"
	"fmt"
	beego "github.com/beego/beego/v2/server/web"
)

func init() {
	err := models.InitDB()
	if err != nil {
		fmt.Println(err)
	}

	beego.Router("/", &controllers.MoviesController{}, "get:Get")
	beego.Router("/create", &controllers.MoviesController{}, "get:GetCreate")
	beego.Router("/create", &controllers.MoviesController{}, "post:Create")
	beego.Router("/delete/:id", &controllers.MoviesController{}, "post:Delete")
	beego.Router("/:id", &controllers.MoviesController{}, "get:GetUpdate")
	beego.Router("/:id", &controllers.MoviesController{}, "post:Update")
	beego.Router("/genres", &controllers.MoviesController{}, "get:MoviesGroupedByGenres")
	beego.Router("/directors", &controllers.MoviesController{}, "get:MoviesGroupedByDirector")
	beego.Router("/", &controllers.MoviesController{}, "post:GetBetweenRating")
	beego.Router("/:id/show", &controllers.MoviesController{}, "get:Show")
}
