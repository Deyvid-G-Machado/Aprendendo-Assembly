NOME = entrada

all: $(NOME)
	@echo "Compilação finalizada."

$(NOME): $(NOME).o
	ld -s -o out/$(NOME) out/$(NOME).o
	rm -f out/$(NOME).o

%.o: %.asm
	nasm -f elf64 -o out/$@ $<

# Cria a pasta "out" se ela não existir
$(shell mkdir -p out)