clear; clc; close all;
%--------------------------------------------------------------------------
%                  Data of Speechrate and phrase timing update
%   @brief: update the data to be fitted by "cftool", after removing the
%       error data
%--------------------------------------------------------------------------
speechRate_phrase=importdata('speechRate_pharse.txt');
speechRate=speechRate_phrase(:,1);
phrase=speechRate_phrase(:,2);
