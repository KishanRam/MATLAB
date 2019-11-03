%function starts here
function[Z_calc] = compressibility(gas,T,P,tUn,pUn)

tic %OUR ADDITION
    %OUR ADDITION - deleted his T and P instantiation
    
switch gas 
% critical properties from http://encyclopedia.airliquide.com/Encyclopedia.asp
    case {'air','AIR','Air'}
        Tc = 132.6; % [K] critical temperature
        Pc = 37.71; % [bar] critical pressure
    
    case {'ammonia','Ammonia','AMMONIA','NH3','nh3','NH_3'}
        Tc = 405.5; % [K] critical temperature
        Pc = 112.8; % [bar] critical pressure
    
    case {'argon','Ar','Argon','ARGON'}
        Tc = 150.8; % [K] critical temperature
        Pc = 48.98; % [bar] critical pressure
 
    case {'butane','BUTANE','Butane'}
        Tc = 425.1; % [K] critical temperature
        Pc = 37.96; % [bar] critical pressure
        
    case {'CO','co','carbon monoxide'} 
        Tc = 132.9; % [K] critical temperature
        Pc = 34.987; % [bar] critical pressure
       
    case {'CO2','co2','CO_2','carbon dioxide'}
        Tc = 304.2; % [K] critical temperature
        Pc = 73.825; % [bar critical pressure
    
    case {'CH4','ch4','methane','Methane','METHANE'}
        Tc = 190.5; % [K] critical temperature
        Pc = 45.96; % [bar] critical pressure
       
    case {'ethane','Ethane','ETHANE'}
        Tc = 305.4; % [K] critical temperature
        Pc = 48.839; % [bar] critical pressure
    
    case {'nitrogen','Nitrogen','NITROGEN','N2','n2','N_2'}
        Tc = 126.2; % [K] critical temperature
        Pc = 33.999; % [bar] critical pressure
    
    case {'oxygen','Oxygen','OXYGEN','O2','o2','O_2'}
        Tc = 154.5; % [K] critical temperature
        Pc = 50.43; % [bar] critical pressure
    
    case {'propane','Propane','PROPANE','C3H8','c3h8'}
        Tc = 369.8; % [K] critical temperature
        Pc = 42.5; % [bar] critical pressure
    
    case {'sulfur dioxide','SO2','so2','SO_2'}
        Tc = 430.8; % [K] critical temperature
        Pc = 78.84; % [bar] critical pressure
    
    case {'SF6','sulfur hexafluoride','sf6','SF_6'}
        Tc = 318.6; % [K] critical temperature
        Pc = 37.59; % [bar] critical pressure
    
    % Quantum gases (require Newton's correction): 
    case {'helium','He','HELIUM','Helium'}
        Tc = 5.1; % [K] critical temperature
        Pc = 2.275; % [bar] critical pressure
 
        Tc = Tc+8; % [K] adjusted critical temperature
        Pc = Pc+8.106; % [bar] adjusted critical pressure
    
    case {'hydrogen','Hydrogen','HYDROGEN','H2','h2','H_2'}
        Tc = 33.2; % [K] critical temperature
        Pc = 12.98; % [bar] critical pressure
 
        Tc = Tc+8; % [K] adjusted critical temperature
        Pc = Pc+8.106; % [bar] adjusted critical pressure
    
    case {'neon','Ne','ne'}
        Tc = 44.3; % [K] critical temperature
        Pc = 27.56; % [bar] critical pressure
 
        Tc = Tc+8; % [K] adjusted critical temperature
        Pc = Pc+8.106; % [bar] adjusted critical pressure
        
    otherwise  %OUR ADDITION - user can input Tc and Pc for gas we don't list
        Tc = input('Desired gas is not in database! Input critical temperature in K: ');  %OUR ADDITION
        Pc = input('Critical pressure in bar: ');  %OUR ADDITION
    end

%OUR ADDITION - converting input temperature to Kelvin, this template comes from
%code option 2 by Bilal Siddiqui
if strcmpi(tUn,'K')   %OUR ADDITION
    T = T;  %OUR ADDITION
elseif strcmpi(tUn,'C')  %OUR ADDITION
    T = T+273.15;  %OUR ADDITION
    tUn = 'K';  %OUR ADDITION
elseif strcmpi(tUn,'F')  %OUR ADDITION
    T = ((T-32)*5/9)+273.15;  %OUR ADDITION
    tUn = 'K';  %OUR ADDITION
elseif strcmpi(tUn,'R')  %OUR ADDITION
    T = T*5/9;  %OUR ADDITION
    tUn = 'K';  %OUR ADDITION
else  %OUR ADDITION
    error('Invalid Temperature units');  %OUR ADDITION
end  %OUR ADDITION

%OUR ADDITION - converting input pressure to bar
if strcmpi(pUn,'bar')  %OUR ADDITION
    P = P;  %OUR ADDITION
elseif strcmpi(pUn, 'atm')  %OUR ADDITION
	P = P*1.01325;  %OUR ADDITION
	pUn = 'bar';  %OUR ADDITION
elseif strcmpi(pUn, 'psi')  %OUR ADDITION
    P = P*0.0689476;  %OUR ADDITION
	pUn = 'bar';  %OUR ADDITION
elseif strcmpi(pUn, 'MPa')  %OUR ADDITION
    P = P*10;  %OUR ADDITION
	pUn = 'bar';  %OUR ADDITION
else  %OUR ADDITION
    error('Invalid Pressure units');  %OUR ADDITION
end  %OUR ADDITION

figure;  %OUR ADDITION - we plot
axes('box','on');  %OUR ADDITION
hold on  %OUR ADDITION

Tr = T/Tc; % reduced temperature
Pr = P/Pc; % reduced pressure 
Z = .01:.01:5; % range of reasonable Z values 
 
nm = max([length(Tr) length(Pr)]);

% Produce a warning if input argument lengths mismatch:
if length(Tr)~=length(Pr) && min([length(Tr) length(Pr)])~= 1
    warning('Temperature and pressure array lengths must match if neither is a scalar.')
end
 
% Brute-force fix to Tr if necessary: 
if length(Tr)==1
    Tr = Tr*ones(size(Pr)); 
end

% Brute-force fix to Pr if necessary: 
if length(Pr)==1
    Pr = Pr*ones(size(Tr)); 
end
 
% Preallocate Z_calc before the loop begins: 
Z_calc = NaN(nm,1);
for iso = 1:length(Tr) %OUR ADDITION - Used to graph at every pressure

    for n = 1:nm
        VanDerWaal = (Z + 27*Pr(n)./(64*((Tr(n))^2).*Z)).*(1 - Pr(n)./(8.*Tr(n).*Z)); 
        Z_calc(n) = interp1(VanDerWaal,Z',1);
    end

    plot( Pr(iso),Z_calc(iso),'+','markeredgecolor','k' );  %OUR ADDITION - plots the reduced pressure with its corresponding Z
    text(1.45,Z_calc(round(length(Z_calc)/2))+.125,['T_r = ' num2str(Tr(iso),'%0.2f')]) %OUR ADDITION- displays the temperature of the isotherm
end   %OUR ADDITION

%OUR ADDITION - Plotting
title('Compressibility Factor Graph')    %OUR ADDITION
xlabel('Reduced Pressure (P_r)');  %OUR ADDITION
ylabel('Compressibility z = PV_m/RT');  %OUR ADDITION
grid on  %OUR ADDITION
legend(gas,'location','southeast');    %OUR ADDITION
toc  %OUR ADDITION

end 