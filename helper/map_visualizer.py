# arquivo para visualização de .data gerado pelo map_creator

from matrix_transposer import transpose

in_list = [int(i.strip()) for i in input("Insira o output no formato .data:\n").split(',')]
W, H = in_list.pop(0), 10
mapa_conv = [[in_list[H*i+j] for j in range(H)] for i in range(W)]
mapa = transpose(mapa_conv)
print("Formato original do mapa:")
for row in mapa:
    print(*row)
