# arquivo auxiliar para a criação de mapas
# gera .data correto da matriz do mapa (matriz normal transposta)

tamanho = [20, 10]
codigos = {0: "Fundo", 1: "Bloco"}
print("Dados atuais sobre o mapa:")
print("Tamanho:", str(tamanho[0])+"x"+str(tamanho[1]))
print("Códigos")
for k, v in codigos.items():
    print(str(k) + ":", v)
print()
print("Imprima, em cada linha", tamanho[0], "códigos, sendo", tamanho[1], "linhas no total")
mapa = [[0 for i in range(tamanho[0])] for j in range(tamanho[1])]
for i in range(tamanho[1]):
    row = [int(i) for i in input().split()]
    for j in range(tamanho[0]):
        mapa[i][j] = row[j]
mapa_conv = [[0 for i in range(tamanho[1])] for j in range(tamanho[0])]
for i in range(tamanho[1]):
    for j in range(tamanho[0]):
        mapa_conv[j][i] = mapa[i][j]
data = []
for i in range(tamanho[0]):
    for j in range(tamanho[1]):
       data.append(mapa_conv[i][j])
out = str(data).strip("[]")
print("Mapa convertido:")
print(out)