TODO=coprod1
TODO=coprod2
TODO=prod1
TODO=comma1
TODO=toro
TODO=c2c1



TMPROOT=/tmp/tmpimg
BASEOUTPUT=$(TODO)

default:
	pdflatex $(TODO).tex
	pdf2svg $(TODO).pdf $(TODO).svg

clean:
	rm *.aux 
	rm *.log
	rm *.pdf

potrace-png:
	convert $(TODO).png $(TMPROOT)-000.pnm
	potrace -b svg -c -q -t 0.1  --tight --output $(BASEOUTPUT).svg  $(TMPROOT)-000.pnm
	# rm $(TMPROOT)-00*
	
