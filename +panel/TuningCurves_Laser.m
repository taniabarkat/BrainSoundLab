function p = TuningCurves_Laser
ph = 365; % panel height
pTitle = 'Tuning Curves Laser';
pTag = 'TuningCurves_Laser';
% Panel and hide button
p = uipanel(gcf, 'Units', 'pixels', 'FontWeight', 'bold', 'Visible', 'off', ...
    'BorderType', 'line', 'HighlightColor', [0.5 0.5 0.5], ...
    'Title', pTitle, ...
    'Tag', pTag, ...
    'Position', [0 0 1000 ph]);
BSL = guidata(gcf);
uicontrol(p, 'Style', 'pushbutton', ...
    'String', char(9645), 'FontWeight', 'bold', 'FontSize', 12, ...
    'HitTest', 'off', ...
    'Callback', @(h,ed) BSL.popPanel(p), ...
    'Position', [957 ph-30 21 16]);
uicontrol(p, 'Style', 'pushbutton', ...
    'String', 'x', ...
    'HitTest', 'off', ...
    'Callback', @(h,ed) BSL.hidePanel(pTag), ...
    'Position', [977 ph-30 20 16]);
% Panel components --------------------------------------------------------
% Spike number as a fct of sweep rate at 40dB
axes('Parent', p, 'Units', 'pixels', 'NextPlot', 'replacechildren', ...
    'Box', 'on', ...
    'FontSize', 9, ...
    'Tag', 'ax_spikenb40_TuningCurvesLaser', ...
    'Position', [60, ph-150, 200, 125]);
xlabel('Sweep rate, |oct/s|');
ylabel('40 Spike nb');
% Spike rate as a fct of sweep rate at 40dB
axes('Parent', p, 'Units', 'pixels', 'NextPlot', 'replacechildren', ...
    'Box', 'on', ...
    'FontSize', 9, ...
    'Tag', 'ax_spikert40_TuningCurvesLaser', ...
    'Position', [60, ph-320, 200, 125]);
xlabel('Sweep rate, |oct/s|');
ylabel('40 Spikerate [Hz]');
% Spike number as a fct of sweep rate at 60dB
axes('Parent', p, 'Units', 'pixels', 'NextPlot', 'replacechildren', ...
    'Box', 'on', ...
    'FontSize', 9, ...
    'Tag', 'ax_spikenb60_TuningCurvesLaser', ...
    'Position', [320, ph-150, 200, 125]);
xlabel('Sweep rate, |oct/s|');
ylabel('60 Spike nb');
% Spike rate as a fct of sweep rate at 60dB
axes('Parent', p, 'Units', 'pixels', 'NextPlot', 'replacechildren', ...
    'Box', 'on', ...
    'FontSize', 9, ...
    'Tag', 'ax_spikert60_TuningCurvesLaser', ...
    'Position', [320, ph-320, 200, 125]);
xlabel('Sweep rate, |oct/s|');
ylabel('60 Spikerate [Hz]');
% Spike number as a fct of sweep rate at 80dB
axes('Parent', p, 'Units', 'pixels', 'NextPlot', 'replacechildren', ...
    'Box', 'on', ...
    'FontSize', 9, ...
    'Tag', 'ax_spikenb80_TuningCurvesLaser', ...
    'Position', [580, ph-150, 200, 125]);
xlabel('Sweep rate, |oct/s|');
ylabel('80 Spike nb');
% Spike rate as a fct of sweep rate at 80dB
axes('Parent', p, 'Units', 'pixels', 'NextPlot', 'replacechildren', ...
    'Box', 'on', ...
    'FontSize', 9, ...
    'Tag', 'ax_spikert80_TuningCurvesLaser', ...
    'Position', [580, ph-320, 200, 125]);
xlabel('Sweep rate, |oct/s|');
ylabel('80 Spikerate [Hz]');

