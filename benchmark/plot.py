#python plot.py results.csv out.png

import sys
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from collections import defaultdict
import re

data = defaultdict(list)
labels = []
total_bytes = 0

with open(sys.argv[1], 'r') as file:
    content = file.read().splitlines()
    header = content[0].split(',')
    
    for line in content[1:-1]:
        l = line.split(',')
        label = l[header.index('label')]
        if not re.search(r'-\d+$', label) and label != 'Test':
            if label not in labels:
                labels.append(label)
            time = l[header.index('timeStamp')]
            value = l[header.index('elapsed')]
            data[label].append((time,value))
            try:
                total_bytes += int(l[header.index('bytes')])
            except Exception:
                pass  

n = len(data.keys())
i = 1
txs = []
duration = 0

f, axs = plt.subplots(n//2 + n % 2, 2, figsize=(8, 4 + n//2 + n % 2))

if n % 2 != 0:
    axs[n//2 + n % 2 - 1, 1].set_axis_off()

for l in labels:
    values = data[l]
    begin = int(min(values)[0])
    end = int(max(values)[0])
    x = [(int(i[0]) - begin)/1000 for i in values]
    y =  [int(i[1]) for i in values]
    plt.subplot(n//2 + n % 2, 2, i)
    plt.scatter(x, y, color='#232323', s=2)
    plt.title(l)
    plt.xlabel('Elapsed Time (s)')
    plt.ylabel('Response Time (ms)')
    #plt.xlabel()
    i += 1

    #stats
    t = len(x) / ((end - begin) / 1000)
    txs.append(t)
    print(l + ': ' + str(t) + ' tx/s')
    if duration == 0:
        duration = (end - begin) / 1000

plt.subplots_adjust(wspace=0.5, hspace=0.6)
#plt.show()
plt.savefig(sys.argv[2], dpi=300)

print('Total: ' + str(sum(txs)) + 'tx/s')
print('\nBandwidth: ' + str(total_bytes/1000000 / duration) + ' MB/s')
