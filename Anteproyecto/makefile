OBJS = AnteproyectoFinal.tex

CC = pdflatex
SHOW = evince

TARGET = AnteproyectoFinal.pdf

all:
	$(CC) $(OBJS)
	$(SHOW) $(TARGET)
#$(TARGET) $(OBJS)
clean:
	-@rm -fr *.log *.aux  *.gz *.lof *.out *.toc *~ 2>/dev/null || true
