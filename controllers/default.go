package controllers

import (
	"github.com/astaxie/beego"
	"qs/models"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {
	c.Data["Website"] = "beego.me"
	c.Data["Email"] = "astaxie@gmail.com"
	c.TplName = "index.tpl"
}

type SearchController struct {
	beego.Controller
}

func (this *SearchController) Get() {
	signIn,err := this.GetInt("signIn")
	if err!= nil {
		signIn = 0
	}
	searchParam := models.SearchParam{this.GetString("driverMobile"),this.GetString("passMobile"),
		this.GetString("startTime"),this.GetString("endTime")}
	mystruct := doSearch(searchParam,signIn,this.GetString("orderId"))
	this.Data["json"] =  &map[string][][]string{"data":mystruct}
	this.ServeJSON()
}


func doSearch(s models.SearchParam , signIn int , orderId string) [][]string  {
	println(signIn)
	println(orderId)
  return  [][]string{{"11","12","13","<a href='#'>14</a>","15","'push_version' : '1','src' : 'ZIF','timestamp' : 1457897340875231, 'type': '8', 'user_id': '564470434826431'}\u0010\t\u001a\u0002\u0008\u0001 "},
    {"21","22","23","24","25","'\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000''\u0000'"},
    {"31","32","33","34","35","26"},
    {"41","42","43","44","45","46"},
    {"51","52","53","54","55","56"},
    {"61","62","63","64","65","66"},
    {"71","72","73","74","75","76"},
    {"81","82","83","84","85","86"},
		{"91","92","93","94","95","96"},
		{"101","82","83","84","85","86"},
		{"111","82","83","84","85","86"}};
}
