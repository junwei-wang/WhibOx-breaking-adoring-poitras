import re

edges = list()
with open('reverse-engineering/step5-circuit-minimization.c') as f:
    for i in range(128):
        pass
    for l in f:
        if not l.strip() or 'include' in l or 'define' in l or 'extern' in l or 'void' in l\
           or '// loop' in l or 'overlap' in l or '}' in l:
            pass
        elif 'encode' in l or 'assign' in l or 'read_bit' in l:
            pass
        elif 'lshift_xor' in l:
            pass
        elif 'decode' in l:
            t = map(int,re.split('[\(\),]', l)[1:-1])
        elif 'expand_bit' in l or 'copy' in l or 'not' in l or 'compress_bit' in l:
            t = map(int, re.split('[\(\),]', l)[1:-1])
            edges.append( str(t[1])+ '->'+ str(t[0]))
        elif ' xor(' in l or 'and' in l or ' or(' in l or 'nxor(' in l:
            t = map(int, re.split('[\(\),]', l)[1:-1])
            edges.append( str(t[1])+ '->'+ str(t[0]))
            edges.append( str(t[2])+ '->'+ str(t[0]))
        elif ' u1' in l:
            t = map(int, re.split('[\(\),]', l)[1:-1])
            edges.append( str(t[1])+ '->'+ str(t[0]))
            edges.append( str(t[2])+ '->'+ str(t[0]))
            edges.append( str(t[3])+ '->'+ str(t[0]))
        elif 'write_bit' in l:
            t = map(int, re.split('[\(\),]', l)[1:-1])
            edges.append( str(t[2])+ '->'+ str(300000))
        elif ' xor1' in l:
            t = map(int, re.split('[\(\),]', l)[1:-1])
            for i in range(2,len(t)):
                edges.append( str(t[i])+ '->'+ str(t[0]))
        elif ' nxor1' in l:
            t = map(int, re.split('[\(\),]', l)[1:-1])
            for i in range(2,len(t)):
                edges.append( str(t[i])+ '->'+ str(t[0]))
        else:
            print 'l--=',l
            break

print '{',
print ','.join(edges),
print '}'
