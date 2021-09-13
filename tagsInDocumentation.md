## Tags and snippets in documentation

### About

In documentations we use marks, tags for

1. Better visual document inspection
2. Tasks collection
3. Progress status

### Implementation

Insert as snippet. Copy snippets setting file to local `C:/Users/jirih/AppData/Roaming/Code/User/snippets/markdown.json`.
Edit with File > Preferences > User Snippets

### FAVICONS

You need these lines in header of your .md, or .Rmd file to see icons rendered.

<link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.13.0/css/all.css"
      integrity="sha384-Bfad6CLCknfcloXFOyFnlgtENryhrpZCe29RTifKEixXQZ38WheV+i/6YWSzkz3V"
      crossorigin="anonymous"
    />

```
<link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.13.0/css/all.css"
      integrity="sha384-Bfad6CLCknfcloXFOyFnlgtENryhrpZCe29RTifKEixXQZ38WheV+i/6YWSzkz3V"
      crossorigin="anonymous"
    />
```
---

### POINTERS

sample syntax :
```
*All © Copyright by Vysoká škola báňská – Technická univerzita Ostrava. All Rights Reserved.*<a href= https://atlas-mobility.danse.tech/ target='_blank'><span style='font-family:Times;font-style: italic;font-size:0.8em;'>Learn more</span></a>
```

> *All © Copyright by Vysoká škola báňská – Technická univerzita Ostrava. All Rights Reserved.* <a href=
https://atlas-mobility.danse.tech/
target='_blank'><span style='font-family:Times;font-style: italic;font-size:0.8em;'>
Learn more
</span></a>

> This is a *pointer to R Markdown* <a href=
https://rmarkdown.rstudio.com/
target='_blank'><i class='fa fa-link fa-2x' style='color: seablue'></i>.</a>

> <a href=
https://rmarkdown.rstudio.com/
target='_blank'><span style='font-family:Arial;font-style: italic;font-size:1em;'>
This is also *pointer to R Markdown*
</span></a>

> <i class='fa fa-thumbtack fa-2x' style='color: blue'></i>
*@hylmarj* will do this
</div>

---

### STATUSES

sample syntax: `<i class="fa fa-wrench fa-2x" style="color: magenta"></i> status :: underConstruction`

<i class="fa fa-wrench fa-2x" style="color: magenta"></i> status :: underConstruction
<i class="fa fa-check-circle fa-2x" style="color: green"></i> status :: completed
<i class="fa fa-exclamation fa-2x" style="color: red"></i> status :: knownIssue
<i class="fa fa-spinner fa-2x" style="color: orange"></i> status :: gettingReady
<i class="fa fa-question fa-2x" style="color: cyan"></i> Status :: isItDone
<i class="fa fa-bomb fa-2x" style="color: firebrick"></i> Status :: solveMe

### DIVISORS

sample syntax: `<div style="text-align:right;background-color:Orange">DIVISOR TEXT</div>`

<div style="text-align:right;background-color:Orange">DIVISOR TEXT</div>
<div style="text-align:right;background-color:Wheat">DIVISOR TEXT</div>
<div style="text-align:right;background-color:RoyalBlue;color:White">DIVISOR TEXT</div>
<div style="text-align:right;background-color:LightBlue">DIVISOR TEXT</div>
<div style="text-align:right;background-color:Brown;color:White">DIVISOR TEXT</div>
<div style="text-align:right;background-color:Tan">DIVISOR TEXT</div>
<div style="text-align:right;background-color:Teal;color:White">DIVISOR TEXT</div>
<div style="text-align:right;background-color:PaleGreen">DIVISOR TEXT</div>
<div style="text-align:right;background-color:Indigo;color:White">DIVISOR TEXT</div>
<div style="text-align:right;background-color:DarkGrey">DIVISOR TEXT</div>
<div style="text-align:right;background-color:Crimson;color:White">DIVISOR TEXT</div>
<div style="text-align:right;background-color:LightPink">DIVISOR TEXT</div>
<div style="text-align:right;background-color:Olive;color:White">DIVISOR TEXT</div>
<div style="text-align:right;background-color:Khaki">DIVISOR TEXT</div>
<div style="text-align:right;background-color:Black;color:White">DIVISOR TEXT</div>
<div style="text-align:right;background-color:Lavender">DIVISOR TEXT</div>
