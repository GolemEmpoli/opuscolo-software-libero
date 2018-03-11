PROJECT  = opuscolo

# Select all raster images
RASTER   = $(notdir $(wildcard img/*))
VPATH		 = img/

all: dist/$(PROJECT).pdf figure

dist/$(PROJECT).pdf: $(PROJECT).tex $(RASTER)
	mkdir -p dist build
	pdflatex -output-directory build -synctex=1 -interaction=nonstopmode $(PROJECT).tex
	pdflatex -output-directory build -synctex=1 -interaction=nonstopmode $(PROJECT).tex
	mv build/$(PROJECT).pdf dist/

figure: $(PDF)
	
clean:
	rm -rf build
	rm -rf $(VEC_DIR)

mrproper: build
	rm -rf dist
