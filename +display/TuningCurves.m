function TuningCurves()
BSL = guidata(gcf);
block = BSL.block;

stim_lev = block.stim(1);
stim_freq = block.stim(2);

ax_spikeNum = findobj('Tag', 'ax_spikeNum');
ax_spikeNumAvg = findobj('Tag', 'ax_spikeNumAvg');

ax_spikeRate = findobj('Tag', 'ax_spikeRate');
ax_spikeRateAvg = findobj('Tag', 'ax_spikeRateAvg');

ax_peakLatencyAvg = findobj('Tag', 'ax_peakLatencyAvg');
ax_peakAmpAvg = findobj('Tag', 'ax_peakAmpAvg');

ax_onsetLatency = findobj('Tag', 'ax_onsetLatency');
ax_spontActivity = findobj('Tag', 'ax_spontActivity');

if strcmp(BSL.stimPrime.label, 'Number')
    % Clear graphs in case of sorting by the trial number
    cla(ax_spikeNumAvg);
    cla(ax_spikeNum);
    
    cla(ax_spikeRateAvg);
    cla(ax_spikeRate);
    
    cla(ax_peakLatencyAvg);
    cla(ax_peakAmpAvg);
    
    cla(ax_onsetLatency);
    cla(ax_spontActivity);
    
else % Sorting by the prime stimulus
    % ----- spikeNum, spikeNumAvg
    trf_num = block.custom.TRFnum{BSL.curGroup}{BSL.curChannel};
    
    plot(BSL.stimPrime.val, trf_num, 'Marker', '.', 'Parent', ax_spikeNum);
    legend(ax_spikeNum, num2str(BSL.stimSecond.val));
    xlabel(ax_spikeNum, BSL.stimPrime.label);
    
    if BSL.stimPrime.ind == stim_lev.ind
        trf_num_avg = mean(trf_num, 2);
    else
        trf_num_avg = mean(trf_num, 1);
    end
    
    plot(BSL.stimPrime.val, trf_num_avg, 'Marker', '.', 'Parent', ax_spikeNumAvg);
    xlabel(ax_spikeNumAvg, BSL.stimPrime.label);
    
    % ----- ax_spikeRate, spikeRateAvg
    trf_rate = block.custom.TRFrate{BSL.curGroup}{BSL.curChannel};
    
    plot(BSL.stimPrime.val, trf_rate, 'Marker', '.', 'Parent', ax_spikeRate);
    xlabel(ax_spikeRate, BSL.stimPrime.label);
    
    if BSL.stimPrime.ind == stim_lev.ind
        trf_rate_avg = mean(trf_rate, 2);
    else
        trf_rate_avg = mean(trf_rate, 1);
    end
    
    plot(BSL.stimPrime.val, trf_rate_avg, 'Marker', '.', 'Parent', ax_spikeRateAvg);
    xlabel(ax_spikeRateAvg, BSL.stimPrime.label);
    
    % ----- peakLatencyAvg, peakAmpAvg, onsetLatency
    
    if BSL.stimPrime.ind == stim_lev.ind
        peakLat = block.custom.peakLat_stim1{BSL.curGroup}{BSL.curChannel};
        peakAmp = block.custom.peakAmp_stim1{BSL.curGroup}{BSL.curChannel};
        onsetLat = block.custom.onsetLat_stim1{BSL.curGroup}{BSL.curChannel};
    else
        peakLat = block.custom.peakLat_stim2{BSL.curGroup}{BSL.curChannel};
        peakAmp = block.custom.peakAmp_stim2{BSL.curGroup}{BSL.curChannel};
        onsetLat = block.custom.onsetLat_stim2{BSL.curGroup}{BSL.curChannel};
    end
    
    plot(BSL.stimPrime.val, peakLat, 'Marker', '.', 'Parent', ax_peakLatencyAvg);
    xlabel(ax_peakLatencyAvg, BSL.stimPrime.label);
    
    plot(BSL.stimPrime.val, peakAmp, 'Marker', '.', 'Parent', ax_peakAmpAvg);
    xlabel(ax_peakAmpAvg, BSL.stimPrime.label);
    
    plot(BSL.stimPrime.val, onsetLat, 'Marker', '.', 'Parent', ax_onsetLatency);
    xlabel(ax_onsetLatency, BSL.stimPrime.label);
%     
%     plot(BSL.stimPrime.val, peak2, 'Marker', '.', 'Parent', ax_spontActivity);
%     xlabel(ax_spontActivity, BSL.stimPrime.label);
end

