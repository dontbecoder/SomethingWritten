# -*- coding: gbk 


Nine_wheel = [11,12,14,16,18,21,24,28,32]

Eight_wheel = [11,13,15,18,21,24,28,32]

Crankset_39 = 39
Crankset_48 = 48
Crankset_46 = 46
Crankset_50 = 50
Crankset_53 = 53
Wheel_size_18 = 18
Wheel_size_16 = 16
Wheel_size_20 = 20

print("Crankset_53 vs 11-32t")
for i in Nine_wheel:
	print(round(Crankset_53/i*Wheel_size_18,2))

#print("Crankset_50 vs 11-32t")
#for i in Nine_wheel:
#	print(round(Crankset_50/i*Wheel_size_16,2))

print("Crankset_39 vs 11-32t")
for i in Nine_wheel:
	print(round(Crankset_39/i*Wheel_size_18,2))

print("Crankset_53 vs 11-32t")
for i in Eight_wheel:
	print(round(Crankset_53/i*Wheel_size_16,2))
print("Crankset_48 vs 11-32t")
for i in Eight_wheel:
	print(round(Crankset_48/i*Wheel_size_16,2))

print("Crankset_46 vs 11-32t")
for i in Eight_wheel:
	print(round(Crankset_46/i*Wheel_size_16,2))	
