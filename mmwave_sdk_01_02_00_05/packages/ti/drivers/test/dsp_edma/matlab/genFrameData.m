%This file generates one frame of ADC samples and stores data in two
%formats: in hex format to file ref_input_frame.dat and binary data 
%to file ref_input_frame.bin
%ADC samples are stored as x[ChirpInd][TxAntInd][RxAntInd][RangeInd]
%Samples are 16-bit complex, real value comes first 
rng(123456789);
nRangeBins = 256; %Number of range bins
nChirpsPerFrame = 64;
nTxAnt = 2;   %Number of Tx antennas
nRxAnt = 4;   %Number of Rx antennas
nAzimBins = 64;
nDopplerBins = nChirpsPerFrame/nTxAnt;  %Number of doppler bins


A = 1000; %amplitude
snrdB = 10;
noiseScale = A/20^(snrdB/20);

Fs=4e6;
freqRangeMaxInd = 35; %Range frequency index
f = (freqRangeMaxInd / nRangeBins) * Fs;

freqDopplerMaxInd = 24;  %Doppler index
phyIncDoppler = 2*pi*freqDopplerMaxInd/nChirpsPerFrame;

freqAzimMaxInd = 10;
phyIncAzim = 2*pi*freqAzimMaxInd/nAzimBins;

x=[];
x=zeros(nRangeBins, nChirpsPerFrame*nRxAnt);

phyDopp=0;
kk=1;
for k=1:nDopplerBins
    phyAzim = 0;
    for m=1:nTxAnt
        for n=1:nRxAnt
            x(:,kk) = A*exp(1j*(2*pi*f/Fs*[0:nRangeBins-1]' + phyDopp + phyAzim)) + noiseScale*1/sqrt(2)*(randn(nRangeBins,1)+1j*randn(nRangeBins,1));
            kk = kk + 1;
            phyAzim = phyAzim + phyIncAzim;
        end
    	phyDopp = phyDopp + phyIncDoppler;
    end
end

figure
plot(20*log10(abs(fft(x))))

xx=round(x(:));
xr = real(xx);
xi = imag(xx);
xr(xr<0)=xr(xr<0)+2^16;
xi(xi<0)=xi(xi<0)+2^16;

%Imaginary in LSB side, Real in MSB
%xxx = xi + xr*2^16;
%Imaginary in MSB side, Real in LSB
xxx = xr + xi*2^16;

%ASCI file:
fid = fopen('ref_input_frame.dat','w');
fprintf(fid, '0x%08x,\n', uint32(xxx));
fclose(fid);
%Binary file:
fid = fopen('ref_input_frame.bin','wb');
fwrite(fid, uint32(xxx), 'uint32');
fclose(fid);





