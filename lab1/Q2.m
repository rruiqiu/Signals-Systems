clc
clear
opts = detectImportOptions('course_grades_2022.xlsx');
opts = setvartype(opts, {'ID_Number', 'Name'}, 'string');
table = readtable('course_grades_2022.xlsx', opts);

H = height(table); %get the total rows of table
%a
[name,totalmark]=getMaximumLabName(table,H);

% a
function [name,totalmark] = getMaximumLabName(table,H)
Lab1mark = table{2:H,"Lab"+wildcardPattern}; %concatenated the table into the 4 * 20 array with each row contain a student lab marks
S = sum(Lab1mark,2); %the sum of each row
% fprintf("%d\n",S)
[M,I] = max(S);% return the index of the maximum student corresponding row and total marks
totalmark = M;
maxlabnameIndex = I+1;% back to the table to add one row index because the maximum mark section of line2
name = table.Name(maxlabnameIndex);%index the row of the student has the highest total lab mark
end

