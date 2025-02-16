# arquivo auxiliar para a criação de mapas
# gera .data correto da matriz do mapa (matriz normal transposta)

from matrix_transposer import transpose

codigos = {0: "Fundo", 1: "Bloco"}
print("Dados atuais sobre o mapa:")
print("Códigos suportados até agora")
for k, v in codigos.items():
    print(str(k) + ":", v)
print()
w, h = int(input('Insira a largura do mapa:\n')), 10 #altura do mapa é sempre 10
print("Imprima, em cada linha", w, "códigos, sendo", h, "linhas no total")
mapa = [[0 for i in range(w)] for j in range(h)]
for i in range(h):
    row = [int(i) for i in input().split()]
    for j in range(w):
        mapa[i][j] = row[j]
mapa_conv = transpose(mapa)
data = [w] #incluir largura do mapa no .data
for i in range(w):
    for j in range(h):
       data.append(mapa_conv[i][j])
out = str(data).strip("[]")
print("Mapa convertido:")
print(out)