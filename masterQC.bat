:: cleanning
:: FOR /r %%f IN (*.aux *.log bu*.* *.bbl *.blg *.mtc* *.out *.maf *.dvi *.toc *.synctex.gz) DO (DEL "%%f")
DEL masterQC.pdf

:: compil page de garde
:: CD front_page
:: DEL front_page_fr.pdf
:: DEL front_page_en.pdf
:: pdflatex front_page_fr.tex
:: pdflatex front_page_en.tex
:: CD ..

:: process de compil tenant compte des multiples bibliographies
:: pdflatex usefull options :
::      -draftmode
pdflatex -interaction=errorstopmode masterQC.tex
:: FOR %%f IN (bu*.aux, master.aux) DO (bibtex %%f)
pdflatex -interaction=errorstopmode masterQC.tex
:: pdflatex -interaction=errorstopmode masterQC.tex

:: clean du répertoire et des sous-répertoires
FOR /r %%f IN (*.aux *.log bu*.* *.bbl *.blg *.mtc* *.out *.maf *.dvi *.toc *.synctex.gz) DO (DEL "%%f")

:: open the master file
start masterQC.pdf