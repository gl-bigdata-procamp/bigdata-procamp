import sys

for line in sys.stdin:
    line = line.strip()
    # words = '\n'.join(['\t'.join([w.strip(), '1']) for w in line.split(" ")])
    print('x\t1')
