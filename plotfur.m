## Copyright (C) 2022 Uncookie
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} plotfur (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Uncookie <uncookie@uncookie>
## Created: 2022-05-06

function retval = plotfur (filename)
  addpath ("/home/uncookie/mats")
  data = load(filename);
  names = fieldnames(data);
  fm = data.(names{2});
  Fs = 80e3;

  Nfft = length(fm(1, :));
  f = (-Nfft/2:Nfft/2 - 1)*Fs/Nfft;
  X = fft(fm(1, :), Nfft);

  set (0, "defaultaxesfontname", "Helvetica") 
  hold on;
  plot(f, 20*log10(abs(fftshift(X))));
  xlabel('frequancy in [HZ]');
  ylabel('Amplitude in [dB]');
  grid on
  title('Frequancy Spectrum');
  print -djpg image.jpg
  
  retval = 15;
  
 % pkg load signal

 % step = ceil(100*Fs/1000)
 % window = ceil(300*Fs/1000)
 % fftn = 2^nextpow2(window)
  
 % figure
 % specgram(fm(1, :), fftn, Fs, window, window-step)
 % xlabel('Time in [sec]')
 % ylabel('Frequancy in [Hz]')
 % grid on
 % title('Short-time Fourier Analysis')

  

endfunction
