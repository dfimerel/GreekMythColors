
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Greek Mythology Color Palettes <img align="right" src="AllPaintings/logo.jpg" width=300>

The GreekMythColors R package provides a color palette inspired by
paintings depicting events from the Greek mythology. At the same time,
you can get a short summary of the corresponding Greek myth, bringing
the ancient world to life through color and storytelling.

This package was motivated and draws heavily from the code of
[{MetBrewer}](https://github.com/BlakeRMills/MetBrewer), the package
with color palettes form the Metropolitan Museum of Art of New York. The
structure of the package and coding, like {MetBrewer}, are based on
[{PNWColors}](https://github.com/jakelawlor/PNWColors) and
[{wesanderson}](https://github.com/karthik/wesanderson).  
Disclaimers: Images of paintings in this content are from Wikipedia, the
free encyclopedia. ChatGPT was used to curate the text for each myth.

## Install package

``` rinstall.packages("devtools")
devtools::install_github("dfimerel/GreekMythColors") 

# If the install_github does not work, try this
library(pak)
pak::pkg_install("dfimerel/GreekMythColors")
```

## Usage

``` r
library(GreekMythColors)

names(myth_palettes)
[1] "Danae"             "Birth_Venus"       "Three_Graces"      "Narcissus"         "Primavera"        
[6] "Perseus_Andromeda" "Medusa"            "Garden_Hesperides" "Galatea"           "Oedipus_Sphinx"   
[11] "Lament_Icarus"     "Ulysses_Sirens"    "Prometheus_Bound"  "Orpheus_Eurydice"  "Fall_Phateon"     
[16] "Bacchus_Ariadne"   "Apollo_Daphne"     
```

## Palettes

### Danae by Titian

<img src="AllPaintings/Danae.png">

------------------------------------------------------------------------

### Birth of Venus by Sandro Botticelli

<img src="AllPaintings/Birth_Venus.png">

------------------------------------------------------------------------

### Three Graces by Raphael

<img src="AllPaintings/Three_Graces.png">

------------------------------------------------------------------------

### Narcissus by Michelangelo Merisi da Caravaggio

<img src="AllPaintings/Narcisus.png">

------------------------------------------------------------------------

### Primavera by Sandro Botticelli

<img src="AllPaintings/Primavera.png">

------------------------------------------------------------------------

### Perseus and Andromeda by Peter Paul Rubens

<img src="AllPaintings/Perseus_Andromeda.png">

------------------------------------------------------------------------

### Medusa by Michelangelo Merisi da Caravaggio

<img src="AllPaintings/Medusa.png">

------------------------------------------------------------------------

### The Garden of Hesperides by Frederic Leighton

<img src="AllPaintings/Garden_Hesperides.png">

------------------------------------------------------------------------

### Galatea by Raphael

<img src="AllPaintings/Galatea.png">

------------------------------------------------------------------------

### Oedipus and the Sphinx by Gustave Moreau

<img src="AllPaintings/Oedipus_Sphinx.png">

------------------------------------------------------------------------

### The Lament of Icarus by Herbert James Draper

<img src="AllPaintings/Lament_Icarus.png">

------------------------------------------------------------------------

### Ulysses and the Sirens by John William Waterhouse

<img src="AllPaintings/Ulysses_Sirens.png">

------------------------------------------------------------------------

### Prometheus Bound by Peter Paul Rubens

<img src="AllPaintings/Prometheus_Bound.png">

------------------------------------------------------------------------

### Orpheus and Eurydice by Nicolas Poussin

<img src="AllPaintings/Orpheus_Eurydice.png">

------------------------------------------------------------------------

### The Fall of Phateon by Peter Paul Rubens

<img src="AllPaintings/Fall_Phateon.png">

------------------------------------------------------------------------

### Bacchus and Ariadne by Titian

<img src="AllPaintings/Bacchus_Ariadne.png">

------------------------------------------------------------------------

### Apollo and Daphne by Piero del Pollaiuolo

<img src="AllPaintings/Apollo_Daphne.png">

------------------------------------------------------------------------

## Examples for using the color palette

``` r
library(ggplot2)
```

``` r
ggplot(data=iris, aes(x=Species, y=Petal.Length, fill=Species)) +
  geom_violin() +
  labs(title = "Petal Length by Species", x = "Species", y = "Petal Length (cm)") +
  scale_fill_manual(values=GreekMyth_palette("Birth_Venus",n=5))+
  theme_classic()
```

<img src="AllPaintings/violinPlot_birth_venus.png">

``` r
ggplot(diamonds, aes(carat, fill = cut)) +
  geom_density(position = "stack") +
  scale_fill_manual(values=GreekMyth_palette("Galatea",n=5))  +
  theme_classic()
```

<img src="AllPaintings/densityPlot_galatea.png">

``` r
ggplot(iris, aes(x = Species, y = Sepal.Length, fill=Species)) +
  geom_bar(stat = "identity") +  
  scale_fill_manual(values = GreekMyth_palette("Three_Graces",n=3), labels = levels(iris$Species)) +  
  labs(title = "Sepal Length by Species", x = "Species", y = "Sepal Length (cm)") +  
  theme_classic()  
```

<img src="AllPaintings/barPlot_three_graces.png">

## How to read the myth corresponding to the color palette

``` r
GreekMyth_story("Danae")
```

### Contact

Contact Danai Fimereli <danai.fimereli@gmail.com> and Veronica Alejandra
Cáceres <valejandracch@gmail.com>
