function p = Electrode
ph = 262; % panel height
pTitle = 'Electrode';
pTag = 'Electrode';
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
% Type
uicontrol(p, 'Style', 'text', 'HorizontalAlignment', 'left', ...
    'String', 'Type:', ...
    'Position', [10 ph-45 75 14]);
uicontrol(p, 'Style', 'popupmenu', 'HorizontalAlignment', 'left', ...
    'BackgroundColor', [1 1 1], ...
    'Enable', 'off', ...
    'Tag', 'pm_type_electrode', ...
    'String', ' ', ...
    'Callback', @(h,ed) Callback_selectType(h, BSL), ...
    'Position', [100 ph-49 111 22]);
% Configuration of channels
uicontrol(p, 'Style', 'text', 'HorizontalAlignment', 'left', ...
    'String', 'Configuration of channels:', ...
    'Position', [10 ph-68 100 14]);
uitable(p, 'Data', [ ], ...
    'ColumnWidth', {30}, ...
    'Enable', 'inactive', ...
    'Tag', 'tab_channels_electrode', ...
    'Position', [10 ph-252 280 180]);

function Callback_selectType(hObject, BSL)
str = get(hObject, 'String');
val = get(hObject, 'Value');

allElectrodeTypes = {BSL.labbook.customElectrode.type};
ind = strcmp(str{val}, allElectrodeTypes);
set(findobj('Tag', 'tab_channels_electrode'), ...
    'Data', BSL.labbook.customElectrode(ind).sites);

display.plotAllChTRF(BSL);

