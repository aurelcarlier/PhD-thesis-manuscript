:: cleanning
FOR /r %%f IN (*.aux *.log bu*.* *.bbl *.blg *.mtc* *.out *.maf *.dvi *.toc *.synctex.gz) DO (DEL "%%f")
DEL master.pdf

:: compil page de garde
CD front_page
DEL front_page_fr.pdf
DEL front_page_en.pdf
pdflatex front_page_fr.tex
pdflatex front_page_en.tex
CD ..

:: process de compil tenant compte des multiples bibliographies
:: pdflatex usefull options :
::      -draftmode 
:: FOR %%f IN (master.aux, chap-*\*.aux) DO (bibtex %%f)

pdflatex -interaction=errorstopmode master.tex

bibtex master.aux
bibtex chap-introduction\intro.aux
bibtex chap-backgroundAndProblem\backgroundAndProblem.aux
bibtex chap-sdp\sdp.aux
bibtex chap-sdpExp\sdpExp.aux
bibtex chap-slpAndEnergy\slpAndEnergy.aux
bibtex chap-slpAndEnergyExp\slpAndEnergyExp.aux
bibtex chap-conclusion\conclusion.aux
bibtex publications\publications.aux

pdflatex -interaction=errorstopmode master.tex
pdflatex -interaction=errorstopmode master.tex

:: clean du répertoire et des sous-répertoires
FOR /r %%f IN (*.aux *.log bu*.* *.bbl *.blg *.mtc* *.out *.maf *.dvi *.toc *.synctex.gz *.lot *.lof) DO (DEL "%%f")

:: open the master file
start master.pdf