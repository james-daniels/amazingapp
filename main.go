package main

import (
	"net/http"
	"os"
	"html/template"
)

type style struct {
	Color	string
}

func handler(w http.ResponseWriter, r *http.Request){
	html :=`
		<body style="background-color: {{.Color}}">
			<h1 style="color:white; text-align:center">This is my Awesome App!</h1>
		</body>`

	c := style{Color: os.Args[1]}
	t := template.Must(template.New("html").Parse(html))
	t.Execute(w, c)
}

func main() {
	http.HandleFunc("/", handler)
	http.ListenAndServe(":8080", nil)
}