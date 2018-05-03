Sources=$(wildcard *.jpg)
Objects=$(Sources:.jpg=.thumb.jpg)

all: pre-build program

pre-build:
	echo "<html><body>" > index.html	


%.thumb.jpg:%.jpg
	convert $< -resize 100x100 $@
	echo "<a href="$<"><img src="$@"/></a>" >> index.html

program: $(Objects)
	echo "</html></body>" >> index.html	
clean: 
	rm -f $(Objects) index.html
