package main

import (
	"net/http"
	"os"
	"text/template"
)

type style struct {
	Color	string
}

var color string

func handler(w http.ResponseWriter, r *http.Request){
	html :=`
		<body style="background-color: {{.Color}}">
		<h1 style="color:white; text-align:center">This is my Awesome App!</h1>
		</body>`

	c := style{Color: color}
	t := template.Must(template.New("html").Parse(html))
	t.Execute(w, c)
}

func main() {
	color = os.Args[1]

	http.HandleFunc("/", handler)
	http.ListenAndServe(":8080", nil)
}