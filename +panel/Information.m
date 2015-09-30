function p = Information
ph = 402; % panel height
pTitle = 'Information';
pTag = 'Information';
% Panel and hide button
p = uipanel(gcf, 'Units', 'pixels', 'FontWeight', 'bold', 'Visible', 'off', ...
    'BorderType', 'line', 'HighlightColor', [0.5 0.5 0.5], ...
    'Title', pTitle, ...
    'Tag', pTag, ...
    'Position', [0 0 300 ph]);
BSL = guidata(gcf);
uicontrol(p, 'Style', 'pushbutton', ...
    'String', 'x', ...
    'HitTest', 'off', ...
    'Callback', @(h,ed) BSL.hidePanel(pTag), ...
    'Position', [277 ph-30 20 16]);
% Panel components --------------------------------------------------------
% Save default
uicontrol(p, 'Style', 'pushbutton', ...
    'String', 'Save default', ...
    'Tag', 'pb_saveDefault_information', ...
    'Enable', 'off', ...
    'Callback', @(h,ed) BSL.saveDataDefault(), ...
    'Position', [10 ph-45 75 22]);
% Save
uicontrol(p, 'Style', 'pushbutton', ...
    'String', 'Save', ...
    'Tag', 'pb_save_information', ...
    'Enable', 'off', ...
    'Callback', @(h,ed) BSL.saveData(), ...
    'Position', [95 ph-45 75 22]);
% Save As
uicontrol(p, 'Style', 'pushbutton', ...
    'String', 'Save As', ...
    'Tag', 'pb_saveAs_information', ...
    'Enable', 'off', ...
    'Callback', @(h,ed) BSL.saveDataAs(), ...
    'Position', [180 ph-45 75 22]);
% Information
uitable(p, 'Data', [], ...
    'Enable', 'inactive', ...
    'RowName', [], 'ColumnName', {'Parameter', 'Value', '', ''}, ...
    'ColumnWidth', {111, 50, 50, 50}, ...
    'ColumnFormat', {'char', 'bank', 'char', 'char'}, ...
    'Tag', 'tab_information', ...
    'Position', [10 ph-225 280 170]);
% Experiment commentaries
uicontrol(p, 'Style', 'text', 'HorizontalAlignment', 'left', ...
    'String', 'Experiment commentaries:', ...
    'Position', [10 ph-246 150 14]);
uicontrol(p, 'Style', 'edit', 'HorizontalAlignment', 'left', ...
    'Max', 10, ... % make a multiline edit box (Max-Min > 1)
    'Enable', 'off', ...
    'Tag', 'e_experimentComments_information', ...
    'Callback', @(h,ed) Callback_experimentComments(h, BSL), ...
    'Position', [10 ph-310 280 60]);
% Block commentaries
uicontrol(p, 'Style', 'text', 'HorizontalAlignment', 'left', ...
    'String', 'Block commentaries:', ...
    'Position', [10 ph-328 150 14]);
uicontrol(p, 'Style', 'edit', 'HorizontalAlignment', 'left', ...
    'Max', 10, ... % make a multiline edit box (Max-Min > 1)
    'Enable', 'off', ...
    'Tag', 'e_blockComments_information', ...
    'Callback', @(h,ed) Callback_blockComments(h, BSL), ...
    'Position', [10 ph-392 280 60]);

function Callback_experimentComments(hObject, BSL)
BSL.labbook.experimentComments = get(hObject, 'String');

function Callback_blockComments(hObject, BSL)
BSL.labbook.blockComments{BSL.curBlock} = get(hObject, 'String');

