function varargout = Cnvex_Hull(varargin)
% CNVEX_HULL M-file for Cnvex_Hull.fig
%      CNVEX_HULL, by itself, creates a new CNVEX_HULL or raises the existing
%      singleton*.
%
%      H = CNVEX_HULL returns the handle to a new CNVEX_HULL or the handle to
%      the existing singleton*.
%
%      CNVEX_HULL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CNVEX_HULL.M with the given input arguments.
%
%      CNVEX_HULL('Property','Value',...) creates a new CNVEX_HULL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Cnvex_Hull_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Cnvex_Hull_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Cnvex_Hull

% Last Modified by GUIDE v2.5 09-Jul-2011 21:57:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Cnvex_Hull_OpeningFcn, ...
                   'gui_OutputFcn',  @Cnvex_Hull_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Cnvex_Hull is made visible.
function Cnvex_Hull_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Cnvex_Hull (see VARARGIN)

% Choose default command line output for Cnvex_Hull
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Cnvex_Hull wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Cnvex_Hull_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnNonExtremePoint.
function btnNonExtremePoint_Callback(hObject, eventdata, handles)
% hObject    handle to btnNonExtremePoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n Points
non_extreme_points(n,Points)
% --- Executes on button press in btnExtremeEdge.
function btnExtremeEdge_Callback(hObject, eventdata, handles)
% hObject    handle to btnExtremeEdge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n Points
extreme_edge(n,Points)

% --- Executes on button press in btnGraham.
function btnGraham_Callback(hObject, eventdata, handles)
% hObject    handle to btnGraham (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n Points
Graham_Scan(n,Points)
% --- Executes on button press in btnFile.
function btnFile_Callback(hObject, eventdata, handles)
% hObject    handle to btnFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n Points
inputfile=uigetfile('*.txt','Choose the specific file :');
Points=load(inputfile);
n=size(Points,1);

% --- Executes on button press in btnRandom.
function btnRandom_Callback(hObject, eventdata, handles)
% hObject    handle to btnRandom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n Points
n=str2double(get(handles.edit1,'string'));
Points=rand(n,2);
scatter(Points(:,1),Points(:,2))

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnReset.
function btnReset_Callback(hObject, eventdata, handles)
% hObject    handle to btnReset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
cla reset