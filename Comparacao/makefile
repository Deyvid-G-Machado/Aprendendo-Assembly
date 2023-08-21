NOME = comparacao
NOME_ENTRADA = comparacao-entrada

all: $(NOME) $(NOME_ENTRADA)
	@echo "Compilação finalizada."

$(NOME): $(NOME).o
	ld -s -o out/$(NOME) out/$(NOME).o
	rm -f out/$(NOME).o

$(NOME_ENTRADA): $(NOME_ENTRADA).o
	ld -s -o out/$(NOME_ENTRADA) out/$(NOME_ENTRADA).o
	rm -f out/$(NOME_ENTRADA).o

%.o: %.asm
	nasm -f elf64 -o out/$@ $<

# Cria a pasta "out" se ela não existir
$(shell mkdir -p out)
