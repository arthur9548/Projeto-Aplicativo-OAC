# transposição de matriz
# necessário para o formato .data

def transpose(m):
    if not m:
        return m
    h = len(m)
    w = len(m[0])
    res = [[0 for j in range(h)] for i in range(w)]
    for i in range(h):
        for j in range(w):
            res[j][i] = m[i][j]
    return res