Tips and scripts to manage the mydata files. And other regular commands.

Some useful lines of code for image processing.

1. To compress jpeg images (first create the directory compressed at the same location)

jpegoptim -m50 -d compressed/ *.jpg

2. Convert jpg to a pdf file.

for x in *.jpg; do convert $x ${x}.pdf; done

3. Merge a pdfs into a single file. (list of source and the last one is the target file name)

pdfunite first.pdf second.pdf third.pdf target.pdf
