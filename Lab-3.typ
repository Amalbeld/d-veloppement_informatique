#import "Class.typ": *


#show: ieee.with(
  title: [#text(smallcaps("Lab #3: Web Application with Genie"))],
  /*
  abstract: [
    #lorem(12).
  ],
  */
  authors:
  (
    (
      name: "amal beldi",
      department: [ELNI],
      organization: [ISET Bizerte --- Tunisia],
      profile: "amalbeld",
    ),

  )
  // index-terms: (""),
  // bibliography-file: "Biblio.bib",
)

= Exercise
In this lab, we will create a basic web application using *Genie framework* in Julia. The application will allow us to control the behaviour of a sine wave, given some adjustble parameters. You are required to carry out this lab using the REPL as in @fig:repl.

#figure(
	image("Images/0_6q1ZoAIh51k7HlRh.png", width: 90%, fit: "contain"),
	caption: "Julia"
	) <fig:repl>

#exo[Sine Wave Control][We provide the Julia and HTML codes to build and run a web app that allows us to control.
* the amplitude* and *frequency* of a sine wave. *Plotly* is used to plot the corresponding graph. 
*Samples* : We also added a slider to change the number of samples used to draw the figure. The latter setting permits to grasp the influence of sampling frequency on the look of our chart.]

#let code=read("../Codes/web-app/app.jl")
#raw(code, lang: "julia")


#let code=read("../Codes/web-app/app.jl.html")
#raw(code, lang: "html")

```zsh
julia --project
```

```julia
cd("location of the folder/infodev/web-app")
julia> using GenieFramework
julia> Genie.loadapp() # Load app
julia> up() # Start the server
```
#figure(
	image("Images/Capture.PNG", width: 100%, fit: "contain"),
	caption: "Genie -> Sine Wave"
	) <fig:wave>


We can now open the browser and navigate to the link #highlight[#link("localhost:8000")[http://127.0.0.1:8000/]].

#exo[Phase][
 Phase ranging between $-pi$ and $pi$, changes by a step of $pi/100$ 
  ]
```zsh
julia
```
```julia
using GenieFramework
@genietools

@app begin
-------
@in pha::Float32 = 1
------
@onchange N, amp, freq , pha begin
        x = range(0, 1, length=N)
        y = amp*sin.(2*π*freq*x .+pha )
```
```zsh
HTML
```

```html
<div class="st-col col-12 col-sm st-module">
        <p><b>phase</b></p>
	<q-slider v-model="pha" 
		:min="-3.14" :max="3.14" 
		:step=".0314" :label="true"> 
	</q-slider>
    </div>
```
#figure(
	image("Images/Capture1.PNG", width: 100%, fit: "contain"),
	caption: "Genie -> Sine Wave with phase"
	) <fig:wave1>

#exo[offset][Offset varies from $-0.5$ to $1$, by a step of $0.1$.]
```zsh
julia
```
```julia
using GenieFramework
@genietools

@app begin
-------
@in ofs::Float32 = 1
------
@onchange N, amp, freq , pha , ofs begin
        x = range(0, 1, length=N)
        y = amp*sin.(2*π*freq*x .+pha ) .+ofs
```
```zsh
HTML
```
```html
<div class="st-col col-12 col-sm st-module">
        <p><b>offset</b></p>
	<q-slider v-model="ofs" 
		:min="-0.5" :max="1" 
		:step="0.1" :label="true"> 
	</q-slider>
    </div>
```
#figure(
	image("Images/Capture2.PNG", width: 100%, fit: "contain"),
	caption: "Genie -> Sine Wave with phase and offset"
	) <fig:wave2>


