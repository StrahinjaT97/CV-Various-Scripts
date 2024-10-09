


def encode(plaintext, keyword):
    s = ""
    k = 0
    for p in plaintext:
        number = ord(p) + ord(keyword[k]) - 65
        if number > ord('Z'):
            number = number - ord('Z') + ord('A') - 1
        print(p, end=" + ")
        print(keyword[k], end=" = ")
        print(chr(number))
        s = s + chr(number)
        k = k + 1
        k = k % len(keyword)
    return s

print(encode("CLOUDQUEUEMOUSEFLASHTABLE", "BROADBAND"))