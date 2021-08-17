import numpy as np
import matplotlib.pyplot as plt
from matplotlib import rc

rc('text', usetex=True)

julia_data = np.loadtxt('julia_networks.txt', delimiter='\t')
python_data = np.loadtxt('python_networks.txt', delimiter='\t')


fig, (ax1, ax2) = plt.subplots(1, 2)
ax1.hist(julia_data[:, 3], bins = 15)
ax1.set_title("Global clustering coefficient in Julia", fontsize = 22)
ax1.tick_params(direction='in', labelsize = 18)
ax1.set_ylim([0, 200])
ax1.set_xlim([-0.05, 0.6])


ax2.hist(python_data[:, 3], bins = 15)
ax2.set_title("Global clustering coefficient in Python", fontsize = 22)
ax2.tick_params(direction='in', labelsize = 18)
ax2.set_ylim([0, 200])
ax2.set_xlim([-0.05, 0.6])

plt.show()

mean_julia = np.mean(julia_data[:, 3])
std_julia = np.std(julia_data[:, 3])
variance_julia = np.var(julia_data[:, 3])

mean_python = np.mean(python_data[:, 3])
std_python = np.std(python_data[:, 3])
variance_python = np.var(python_data[:, 3])


print("mean in Julia: " + str(mean_julia))
print("std in Julia: " + str(std_julia))
print("variance in Julia: " + str(variance_julia))

print("mean in Python: " + str(mean_python))
print("std in Python: " + str(std_python))
print("variance in Python: " + str(variance_python))





