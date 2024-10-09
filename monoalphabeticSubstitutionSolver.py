

dictionary = {
    'a':'',
    'b':'',
    'c':'',
    'd':'',
    'e':'',
    'f':'',
    'g':'',
    'h':'',
    'i':'',
    'j':'',
    'k':'',
    'l':'',
    'm':'',
    'n':'',
    'o':'',
    'p':'',
    'q':'',
    'r':'',
    's':'',
    't':'',
    'u':'',
    'v':'',
    'w':'',
    'x':'',
    'y':'',
    'z':'',
    '.':'.',
    ',':',',
    ' ':' '
}
decypher = ''

cypher = """
"""

plaintext = ''
for i in range(len(cypher)):
    if cypher[i] == "\n":
        plaintext = plaintext + "\n"
    elif dictionary[cypher[i]] == '':
        plaintext = plaintext + '_'
    else:
        plaintext = plaintext + dictionary[cypher[i]]
print(plaintext)

print('======================')
cypher = ''
plaintext = ''
for i in range(len(cypher)):
    plaintext = plaintext + (dictionary[cypher[i]] if dictionary[cypher[i]] != '' else '?')
print(plaintext)

print('=========SOLUTION:=============')
plaintext = ''
for i in range(len(decypher)):
    plaintext = plaintext + (dictionary[decypher[i]] if dictionary[decypher[i]] != '' else '?')
print(plaintext)

