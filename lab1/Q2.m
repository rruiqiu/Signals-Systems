clc
clear
opts = detectImportOptions('course_grades_2022.xlsx');
opts = setvartype(opts, {'ID_Number', 'Name'}, 'string');
table = readtable('course_grades_2022.xlsx', opts);

H = height(table); %get the total rows of table
%a
[labname,labtotalmark]=getMaximumLabName(table,H);
fprintf('%s get the highest lab mark, the total mark is %d.\n',labname,labtotalmark);
%b
[examname,examtotalmark]=getMaximumExamName(table,H);
fprintf('%s get the highest exam mark, the total mark is %d.\n',examname,examtotalmark);
%c
[finalname,finaltotalmark]=getMaximumFinalName(table,H);
fprintf('%s get the highest fintal total mark, the total mark is %d.\n',finalname,finaltotalmark);
%d
cellPatients = {'Rui Qiu','400318681',10,10,10,10,10,10,10,10,10;
                'Shabab Rahman','400291441',10,10,10,10,10,10,10,10,10};
disp(cellPatients)
table = [table;cellPatients];

% a
function [name,totalmark] = getMaximumLabName(table,H)
LabMark = table{2:H,"Lab"+wildcardPattern}; %concatenated the table into the 4 * 20 array with each row contain a student lab marks
S = sum(LabMark,2); %the sum of each row, 2 identify direction which is row, 1 for column
% fprintf("%d\n",S)
[M,I] = max(S);% return the index of the maximum student corresponding row and total marks
totalmark = M;
maxlabnameIndex = I+1;% back to the table to add one row index because the maximum mark section of line2
name = table.Name(maxlabnameIndex);%index the row of the student has the highest total lab mark
end

%b
function [name,totalmark] = getMaximumExamName(table,H)
ExamMark = table{2:H,"Exam"+wildcardPattern}; %concatenated the table into the 4 * 20 array with each row contain a student lab marks
S = sum(ExamMark,2); %the sum of each row
% fprintf("%d\n",S)
[M,I] = max(S);% return the index of the maximum student corresponding row and total marks
totalmark = M;
maxlabnameIndex = I+1;% back to the table to add one row index because the maximum mark section of line2
name = table.Name(maxlabnameIndex);%index the row of the student has the highest total exam mark
end

%c get final mark
function [name,totalmark] = getMaximumFinalName(table,H)
S = vartype("numeric");%specfic the type of extracting data is numberic
FinalMark = table{2:H,S}; %extract data except name and student id(because string)
Sum = sum(FinalMark,2);
[M,I] = max(Sum);
totalmark = M;
maxlabnameIndex = I+1;
name = table.Name(maxlabnameIndex);
end


