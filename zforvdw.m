%our own script, not part of original code
gas = input('Gas: ','s');
T = input('Temperature: ');
tUn = input('Units of temperature (K, C, F, R): ', 's');
P = input('Pressure: ');
pUn = input('Units of pressure (bar, MPa, atm, psi): ', 's');
compressibility(gas,T,P,tUn,pUn);	%calls function