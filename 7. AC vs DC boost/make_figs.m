% make_figs.m: white-background report figures from logged scope data
get = @(s,k) squeeze(s.signals(k).values);
ia  = get(iscope,1);  idc   = get(iscope,2);   % AC-DC / DC input currents
vac = get(vscope,1);  vdc   = get(vscope,4);   % AC-DC / DC output voltages
ti  = iscope.time;    tv    = vscope.time;

mk(tv,vac,tv,vdc,[0 1],       'Output voltage (V)',  'Startup: output voltage',            'fig_startup_voltage.png');
mk(ti,ia, ti,idc,[0 1],       'Input current (A)',   'Startup: input current',             'fig_startup_current.png');
mk(tv,vac,tv,vdc,[0.985 0.995],'Output voltage (V)', 'Steady-state output voltage ripple', 'fig_vout_ripple_zoom.png');
mk(ti,ia, ti,idc,[0.98 1.0],  'Input current (A)',   'Steady-state input current',         'fig_input_current_zoom.png');

function mk(t1,y1,t2,y2,xl,yl,ttl,fn)
    f = figure('Color','w','Position',[100 100 900 450]);
    plot(t1,y1,'Color',[0.85 0.60 0],'LineWidth',1.2); hold on
    plot(t2,y2,'Color',[0 0.45 0.74],'LineWidth',1.2);
    xlim(xl); k = t1>=xl(1) & t1<=xl(2);        % fit y to the visible window
    lo = min([y1(k);y2(k)]); hi = max([y1(k);y2(k)]); p = 0.05*(hi-lo);
    ylim([lo-p hi+p]);
    grid on; box on;
    set(gca,'Color','w','XColor','k','YColor','k','GridColor',[0.7 0.7 0.7],'FontSize',11);
    xlabel('Time (s)'); ylabel(yl); title(ttl);
    legend('AC-DC boost','DC boost','Location','best');
    print(f, fn, '-dpng', '-r300'); close(f);
end