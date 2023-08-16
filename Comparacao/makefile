NOME = comparacao
NOME_ENTRADA = comparacao-entrada

all: $(NOME) $(NOME_ENTRADA)

$(NOME): $(NOME).o
	ld -s -o $(NOME) $(NOME).o
	rm -f $(NOME).o

$(NOME_ENTRADA): $(NOME_ENTRADA).o
	ld -s -o $(NOME_ENTRADA) $(NOME_ENTRADA).o
	rm -f $(NOME_ENTRADA).o

%.o: %.asm
	nasm -f elf64 -o $@ $<
