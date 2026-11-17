iscope = out.iscope;
vscope = out.vscope;
% ac_metrics.m: steady-state window 0.6 to 1.0 s = 20 whole line cycles
fs = 1e5;  t = (0.6 : 1/fs : 1.0 - 1/fs)';
get = @(s,k) interp1(s.time, squeeze(s.signals(k).values), t);
i_ac  = get(iscope,1);   % AC input current
v_in  = get(vscope,2);   % AC source voltage
vo_ac = get(vscope,1);   vo_dc = get(vscope,4);

% THD up to 40th harmonic, fundamental = bin 21 (20 cycles in window)
N = numel(i_ac);  Y = abs(fft(i_ac))/N*2;
k1 = 21;  h = k1 + (1:39)*20;           % bins of harmonics 2..40
THD = sqrt(sum(Y(h).^2)) / Y(k1) * 100;

P  = mean(v_in .* i_ac);
PF = P / (rms(v_in) * rms(i_ac));

fprintf('THD (i_ac, to 40th) = %.1f %%\n', THD);
fprintf('PF = %.3f\n', PF);
fprintf('Vout ripple pk-pk: AC %.3f V, DC %.3f V\n',max(vo_ac)-min(vo_ac), max(vo_dc)-min(vo_dc));
w  = t >= 0.8;                          % last 0.2 s = 10 line cycles
pp = @(x) max(x(w)) - min(x(w));
sw = @(x) pp(x - movmean(x, 100));      % strips anything slower than 1 ms
fprintf('Vout pk-pk (total):  AC %.3f V, DC %.3f V\n', pp(vo_ac), pp(vo_dc));
fprintf('Switching ripple:    AC %.3f V, DC %.3f V\n', sw(vo_ac), sw(vo_dc));